import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tabiat_tarihi_app/MainPage.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      /*options: DefaultFirebaseOptions.currentPlatform,*/
      );
  FirebaseFirestore.instance.clearPersistence();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: MainPage()),
    );
  }
}
