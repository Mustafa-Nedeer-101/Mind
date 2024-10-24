// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDA1MfkjjRgFJ_1Dn-h4B242Y_8NFdiE1o',
    appId: '1:472698833587:web:09bf693cbb550246707ec6',
    messagingSenderId: '472698833587',
    projectId: 'mind-24edb',
    authDomain: 'mind-24edb.firebaseapp.com',
    storageBucket: 'mind-24edb.appspot.com',
    measurementId: 'G-TSY7M11SWX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC-EFEtK_DUlJ2ufp-RTPU6RwZ7QmZ8lP4',
    appId: '1:472698833587:android:2b44e9a994ac8646707ec6',
    messagingSenderId: '472698833587',
    projectId: 'mind-24edb',
    storageBucket: 'mind-24edb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA-bBxWDbJNcFYDwxjmsG4WEU6cAyTJB_w',
    appId: '1:472698833587:ios:342969e12a1b01ae707ec6',
    messagingSenderId: '472698833587',
    projectId: 'mind-24edb',
    storageBucket: 'mind-24edb.appspot.com',
    iosBundleId: 'com.example.mind',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA-bBxWDbJNcFYDwxjmsG4WEU6cAyTJB_w',
    appId: '1:472698833587:ios:342969e12a1b01ae707ec6',
    messagingSenderId: '472698833587',
    projectId: 'mind-24edb',
    storageBucket: 'mind-24edb.appspot.com',
    iosBundleId: 'com.example.mind',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDA1MfkjjRgFJ_1Dn-h4B242Y_8NFdiE1o',
    appId: '1:472698833587:web:99d01e0a6c2b5f96707ec6',
    messagingSenderId: '472698833587',
    projectId: 'mind-24edb',
    authDomain: 'mind-24edb.firebaseapp.com',
    storageBucket: 'mind-24edb.appspot.com',
    measurementId: 'G-8G4EW47J3T',
  );
}
