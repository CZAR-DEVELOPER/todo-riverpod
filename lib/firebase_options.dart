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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCFBrAmRfbbI4rF8yV76pbppoY1My99zoo',
    appId: '1:466712135858:web:15e8f2228a9fa7c1fa61ab',
    messagingSenderId: '466712135858',
    projectId: 'alan-todo-48828',
    authDomain: 'alan-todo-48828.firebaseapp.com',
    storageBucket: 'alan-todo-48828.appspot.com',
    measurementId: 'G-BBSE7LH1QB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCR75UbWVFGTRA7gE6thKCBMbjQ4DkB91Y',
    appId: '1:466712135858:android:faf3a9ca7208a590fa61ab',
    messagingSenderId: '466712135858',
    projectId: 'alan-todo-48828',
    storageBucket: 'alan-todo-48828.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqXZy6Tw3j3k7_5HKuwK2tb0QwMWnDqdM',
    appId: '1:466712135858:ios:af71390ef2fa5a16fa61ab',
    messagingSenderId: '466712135858',
    projectId: 'alan-todo-48828',
    storageBucket: 'alan-todo-48828.appspot.com',
    iosBundleId: 'com.example.alanTodo',
  );
}
