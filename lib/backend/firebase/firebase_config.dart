import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAHlIb2Q7qDNAP6zhch2DMlhJlDF3M-ixw",
            authDomain: "twittyv2-865d9.firebaseapp.com",
            projectId: "twittyv2-865d9",
            storageBucket: "twittyv2-865d9.appspot.com",
            messagingSenderId: "996089726548",
            appId: "1:996089726548:web:4fb208f04e830285f5cfc1"));
  } else {
    await Firebase.initializeApp();
  }
}
