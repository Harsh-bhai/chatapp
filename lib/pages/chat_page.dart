import 'package:chatapp/components/chat_bubble.dart';
import 'package:chatapp/components/my_text_field.dart';
import 'package:chatapp/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  const ChatPage(
      {super.key,
      required this.receiverUserEmail,
      required this.receiverUserID});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      _chatService.sendMessage(widget.receiverUserID, _messageController.text);
      // clear the controller after sending the message
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("@${widget.receiverUserEmail.split("@")[0]}"),
      ),
      body: Column(
        children: [
          // messages
          Expanded(child: _buildMessageList()),
          // user input
          _buildMessageInput()
        ],
      ),
    );
  }

  // build message list
  Widget _buildMessageList() {
    return StreamBuilder(
      stream: _chatService.getMessages(
          _firebaseAuth.currentUser!.uid, widget.receiverUserID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        return ListView(
          children: snapshot.data!.docs
              .map((document) => _buildMessageItem(document))
              .toList(),
        );
      },
    );
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    // align the messages to right if the sender is the current user, otherwise to the left
    var alignment = (data["senderId"] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: data["senderId"] == _firebaseAuth.currentUser!.uid
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            // Text("@${data["senderEmail"].toString().split("@")[0]}"),
            ChatBubble(
                message: data["message"],
                color: data["senderId"] == _firebaseAuth.currentUser!.uid
                    ? Colors.green.shade500
                    : Colors.grey.shade600),
          ],
        ),
      ),
    );
  }

  // build message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          // text field
          Expanded(
            child: MyTextField(
              controller: _messageController,
              placeholder: "Enter message",
              obscureText: false,
            ),
          ),

          // send button
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(Icons.send),
            color: Colors.green.shade500,
            iconSize: 40,
          ),
        ],
      ),
    );
  }
}
