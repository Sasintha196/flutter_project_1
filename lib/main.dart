//import 'package:chatapp1/anothaer/Log.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_slt/Log.dart';
//import 'login.dart';

//Future<void>
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAHrkVhZyGSSqr6-uf4rPOFG4BL1gpc-VI",
    appId: "1:629593261859:web:56d54a7ace4d82140e2e96",
    messagingSenderId: "629593261859",
    projectId: "generator-9dc6f",
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
