import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
        return linux;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDqysBkovOJGNyAjA-GbtNjEXP2QRK_D78',
    appId: '1:392027279986:android:d3d49fb6720453e31a28eb',
    messagingSenderId: '392027279986',
    projectId: 'flutterbd-5d2be',
    authDomain: 'flutterbd-5d2be.firebaseapp.com',
    storageBucket: 'flutterbd-5d2be.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqysBkovOJGNyAjA-GbtNjEXP2QRK_D78',
    appId: '1:392027279986:android:d3d49fb6720453e31a28eb',
    messagingSenderId: '392027279986',
    projectId: 'flutterbd-5d2be',
    storageBucket: 'flutterbd-5d2be.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqysBkovOJGNyAjA-GbtNjEXP2QRK_D78',
    appId: '1:392027279986:android:d3d49fb6720453e31a28eb',
    messagingSenderId: '392027279986',
    projectId: 'flutterbd-5d2be',
    storageBucket: 'flutterbd-5d2be.firebasestorage.app',
    iosBundleId: 'com.example.activite3',
  );

  static const FirebaseOptions macos = ios;
  static const FirebaseOptions windows = web;
  static const FirebaseOptions linux = web;
}
