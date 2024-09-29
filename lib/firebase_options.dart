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
    apiKey: 'AIzaSyCA2D9vEZQFE8op1ME8cIIgM7H-V1AexKc',
    appId: '1:1083694915581:web:3b9cf883e183fd3430c394',
    messagingSenderId: '1083694915581',
    projectId: 'temry-market',
    authDomain: 'temry-market.firebaseapp.com',
    storageBucket: 'temry-market.appspot.com',
    measurementId: 'G-LDDRD4MXTM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1707tEBZJQH7Bg5J9Yrq5kpLZMtyr_qY',
    appId: '1:1083694915581:android:c682516b59dfeca730c394',
    messagingSenderId: '1083694915581',
    projectId: 'temry-market',
    storageBucket: 'temry-market.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkOH76yZXqrYyRzKRW7wYsTV9Dy4SQUBs',
    appId: '1:1083694915581:ios:3016a287f64bb36830c394',
    messagingSenderId: '1083694915581',
    projectId: 'temry-market',
    storageBucket: 'temry-market.appspot.com',
    iosBundleId: 'com.example.temryMarket',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkOH76yZXqrYyRzKRW7wYsTV9Dy4SQUBs',
    appId: '1:1083694915581:ios:3016a287f64bb36830c394',
    messagingSenderId: '1083694915581',
    projectId: 'temry-market',
    storageBucket: 'temry-market.appspot.com',
    iosBundleId: 'com.example.temryMarket',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCA2D9vEZQFE8op1ME8cIIgM7H-V1AexKc',
    appId: '1:1083694915581:web:b84420d8f48b7faf30c394',
    messagingSenderId: '1083694915581',
    projectId: 'temry-market',
    authDomain: 'temry-market.firebaseapp.com',
    storageBucket: 'temry-market.appspot.com',
    measurementId: 'G-N4L1KZ7L2S',
  );
}
