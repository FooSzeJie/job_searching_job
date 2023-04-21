import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_searching_app/database//widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Connect the Firebase
  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //     apiKey: "AIzaSyD3f7aaAE_-WPgOK0AVS0WCaDa-7iaUevA",
      //     appId: "1:1060739077677:android:3f5ff7a720da2385604aa4",
      //     messagingSenderId: "1060739077677",
      //     projectId: "jobsearchingapp-b589e",
      // ),
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Searching App',
      theme: ThemeData(
        primaryColor: const Color(0xFF43B1B7),
        accentColor: const Color(0xFFFED408),
      ),
      home: const WidgetTree(),
    );
  }
}
