import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB-QAQSCPquhIDrxetNHD79ihEas0Evs8Q",
            authDomain: "o2-demo-flutterflow.firebaseapp.com",
            projectId: "o2-demo-flutterflow",
            storageBucket: "o2-demo-flutterflow.appspot.com",
            messagingSenderId: "393980758820",
            appId: "1:393980758820:web:d172b67ed355aed7d6c1b1",
            measurementId: "G-GZED1LFDD5"));
  } else {
    await Firebase.initializeApp();
  }
}
