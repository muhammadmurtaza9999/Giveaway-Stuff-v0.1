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
    apiKey: 'AIzaSyAmTN1tGrXtUSWhlzoQjMREDaUQ69b3iL8',
    appId: '1:748905947811:web:cb1a88a1518a6efe6e9516',
    messagingSenderId: '748905947811',
    projectId: 'giveaway-839d2',
    authDomain: 'giveaway-839d2.firebaseapp.com',
    storageBucket: 'giveaway-839d2.appspot.com',
    measurementId: 'G-M4Z20WLWWV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9iNdyKMsyq659kFDn1xGzqrHtKFSiXO4',
    appId: '1:748905947811:android:3c645bf1f6db595c6e9516',
    messagingSenderId: '748905947811',
    projectId: 'giveaway-839d2',
    storageBucket: 'giveaway-839d2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBng-iiutYOZ1lf-NC7K-jnHNTRCQS_qdw',
    appId: '1:748905947811:ios:abc1df5f8b633c486e9516',
    messagingSenderId: '748905947811',
    projectId: 'giveaway-839d2',
    storageBucket: 'giveaway-839d2.appspot.com',
    androidClientId: '748905947811-b7slhhbpk2995umqjilj44un4c4urp1f.apps.googleusercontent.com',
    iosBundleId: 'com.example.gasApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBng-iiutYOZ1lf-NC7K-jnHNTRCQS_qdw',
    appId: '1:748905947811:ios:abc1df5f8b633c486e9516',
    messagingSenderId: '748905947811',
    projectId: 'giveaway-839d2',
    storageBucket: 'giveaway-839d2.appspot.com',
    androidClientId: '748905947811-b7slhhbpk2995umqjilj44un4c4urp1f.apps.googleusercontent.com',
    iosBundleId: 'com.example.gasApp',
  );
}
