import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCqb47Y400Zj1-B7ySJcIeXmHUNgpZlS44",
            authDomain: "movie-flix-mxnzli.firebaseapp.com",
            projectId: "movie-flix-mxnzli",
            storageBucket: "movie-flix-mxnzli.appspot.com",
            messagingSenderId: "909610626032",
            appId: "1:909610626032:web:dd619753dc91e3838b0b35"));
  } else {
    await Firebase.initializeApp();
  }
}
