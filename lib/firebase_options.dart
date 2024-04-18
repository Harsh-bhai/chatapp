// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAaRWf2bzEvey-9J87Un3kXX1O7VZbIWDw',
    appId: '1:887220579244:web:cf717275e56318ec0fa809',
    messagingSenderId: '887220579244',
    projectId: 'chatapp-dbf77',
    authDomain: 'chatapp-dbf77.firebaseapp.com',
    storageBucket: 'chatapp-dbf77.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7fcRPonKh37ZEcVDq-jR5UKfjwFgC5qQ',
    appId: '1:887220579244:android:6ab5c425c3c5cea70fa809',
    messagingSenderId: '887220579244',
    projectId: 'chatapp-dbf77',
    storageBucket: 'chatapp-dbf77.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDarPK-CUPRMGlLxr46t8A-QSOSkEsiwU0',
    appId: '1:887220579244:ios:c6bae75c268ccb4d0fa809',
    messagingSenderId: '887220579244',
    projectId: 'chatapp-dbf77',
    storageBucket: 'chatapp-dbf77.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDarPK-CUPRMGlLxr46t8A-QSOSkEsiwU0',
    appId: '1:887220579244:ios:aefb4aa96b22c6950fa809',
    messagingSenderId: '887220579244',
    projectId: 'chatapp-dbf77',
    storageBucket: 'chatapp-dbf77.appspot.com',
    iosBundleId: 'com.example.chatapp.RunnerTests',
  );
}
