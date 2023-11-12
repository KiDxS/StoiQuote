import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDt2_3aUDegr18OeiAzenuFyPNdkCQaspg",
            authDomain: "stoi-quote-fnm5sp.firebaseapp.com",
            projectId: "stoi-quote-fnm5sp",
            storageBucket: "stoi-quote-fnm5sp.appspot.com",
            messagingSenderId: "436578221818",
            appId: "1:436578221818:web:60fe9519710d31773d5343"));
  } else {
    await Firebase.initializeApp();
  }
}
