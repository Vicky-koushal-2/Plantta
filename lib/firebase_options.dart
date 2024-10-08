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
    apiKey: 'AIzaSyCqzJGRYN0Hm3Db1B7CsxsjJE_jXRsGPRQ',
    appId: '1:234038934734:web:ccfbf2129d71a97223a49f',
    messagingSenderId: '234038934734',
    projectId: 'plantta-a4da9',
    authDomain: 'plantta-a4da9.firebaseapp.com',
    storageBucket: 'plantta-a4da9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvcARyBokvPeU-VUdTorQnT9MLYWeG5Qo',
    appId: '1:234038934734:android:9d996a5ab4d2e3c923a49f',
    messagingSenderId: '234038934734',
    projectId: 'plantta-a4da9',
    storageBucket: 'plantta-a4da9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChyPaqbtE-uC2tEv8e7Vvq86BObxxrTbI',
    appId: '1:234038934734:ios:07a4658749ec292e23a49f',
    messagingSenderId: '234038934734',
    projectId: 'plantta-a4da9',
    storageBucket: 'plantta-a4da9.appspot.com',
    iosBundleId: 'com.example.plantta',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChyPaqbtE-uC2tEv8e7Vvq86BObxxrTbI',
    appId: '1:234038934734:ios:07a4658749ec292e23a49f',
    messagingSenderId: '234038934734',
    projectId: 'plantta-a4da9',
    storageBucket: 'plantta-a4da9.appspot.com',
    iosBundleId: 'com.example.plantta',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCqzJGRYN0Hm3Db1B7CsxsjJE_jXRsGPRQ',
    appId: '1:234038934734:web:d8c6136532dd338523a49f',
    messagingSenderId: '234038934734',
    projectId: 'plantta-a4da9',
    authDomain: 'plantta-a4da9.firebaseapp.com',
    storageBucket: 'plantta-a4da9.appspot.com',
  );
}
