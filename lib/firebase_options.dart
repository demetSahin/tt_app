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
/// 
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
    apiKey: 'AIzaSyAlFlN8DfmdP4FPHc4mBTX6pRD7Ct7w7-0',
    appId: '1:704479671243:web:b48c8cc0bc937cc6e9bc4e',
    messagingSenderId: '704479671243',
    projectId: 'qrdeneme-e5ecd',
    authDomain: 'qrdeneme-e5ecd.firebaseapp.com',
    storageBucket: 'qrdeneme-e5ecd.appspot.com',
    measurementId: 'G-DSC8HQJ098',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoi3LvRZQLg4u5_yNl08OCHKDpvCLoA4s',
    appId: '1:704479671243:android:208424c76957bd68e9bc4e',
    messagingSenderId: '704479671243',
    projectId: 'qrdeneme-e5ecd',
    storageBucket: 'qrdeneme-e5ecd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArLp0Lbmr89xiH0egrRhIIm_LN8ulK6C0',
    appId: '1:704479671243:ios:4a434505c7181b6fe9bc4e',
    messagingSenderId: '704479671243',
    projectId: 'qrdeneme-e5ecd',
    storageBucket: 'qrdeneme-e5ecd.appspot.com',
    iosClientId: '704479671243-jdbfb82s53jc16fb811atj82g31k0j2d.apps.googleusercontent.com',
    iosBundleId: 'com.example.qrDeneme',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArLp0Lbmr89xiH0egrRhIIm_LN8ulK6C0',
    appId: '1:704479671243:ios:4a434505c7181b6fe9bc4e',
    messagingSenderId: '704479671243',
    projectId: 'qrdeneme-e5ecd',
    storageBucket: 'qrdeneme-e5ecd.appspot.com',
    iosClientId: '704479671243-jdbfb82s53jc16fb811atj82g31k0j2d.apps.googleusercontent.com',
    iosBundleId: 'com.example.qrDeneme',
  );
}
