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
    apiKey: 'AIzaSyAh3EA3MFNZS7eCCxMjogus7onDWv2P15k',
    appId: '1:1056493096810:web:21631e02a77079e138df13',
    messagingSenderId: '1056493096810',
    projectId: 'slash-30b08',
    authDomain: 'slash-30b08.firebaseapp.com',
    storageBucket: 'slash-30b08.appspot.com',
    measurementId: 'G-EDTB68JVVM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB_N3B7qmOYxvOGigzTbikDbUJl90g3nOE',
    appId: '1:1056493096810:android:c258117e6dd9fb9138df13',
    messagingSenderId: '1056493096810',
    projectId: 'slash-30b08',
    storageBucket: 'slash-30b08.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBEhSgDiB1JFDSvOMGSfQNYcCm2ehSmVYI',
    appId: '1:1056493096810:ios:f4a14804b4eae58438df13',
    messagingSenderId: '1056493096810',
    projectId: 'slash-30b08',
    storageBucket: 'slash-30b08.appspot.com',
    iosClientId:
        '1056493096810-u9v4ad3e5hronba7t86b5kfqs8orge23.apps.googleusercontent.com',
    iosBundleId: 'com.example.slash',
  );
}
