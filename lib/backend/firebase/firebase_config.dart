import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBGatSmHWhdkDfBCFTEfkzL-mIfV3ugNc8",
            authDomain: "aeventus-32c30.firebaseapp.com",
            projectId: "aeventus-32c30",
            storageBucket: "aeventus-32c30.appspot.com",
            messagingSenderId: "307000867514",
            appId: "1:307000867514:web:31cf82a0e2aa67f056a083"));
  } else {
    await Firebase.initializeApp();
  }
}
