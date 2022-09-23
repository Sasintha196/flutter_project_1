import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_slt/Log.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;
  final fs = FirebaseFirestore.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('user');

  final userNameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
      new TextEditingController();
  //final idControler = new TextEditingController();
  //final categoryController = new TextEditingController();
  final appointedAsController = new TextEditingController();
  //final unitController = new TextEditingController();
  final contactnumberController = new TextEditingController();
//////////////////////////////////////////////////////////////////
  List<String> items = [
    'Consultant',
    'Doctor',
    'Nurse',
    'Attendent',
    'Pharmacist',
    'Administrator'
  ];
  String? selectedItem = 'Consultant';
//////////////////////////////////////////
  var error = null;

  register(String email, String password) async {
    if (error == null) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
      });
    } else {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              color: Colors.grey.shade200,
              margin: const EdgeInsets.only(
                  left: 0.0, right: 0.0, top: 0.0, bottom: 100),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(140),
                      bottomRight: Radius.circular(140))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 50, right: 50, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Create Your Account",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "&",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                    const Text("Sign In",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue)),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      //clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: TextField(
                        controller: userNameController,
                        cursorColor: Colors.black26,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            filled: true,
                            labelStyle: TextStyle(
                                color: Colors.black54, fontSize: 10.0),
                            labelText: 'User Name',
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      //clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: TextField(
                        controller: emailController,
                        cursorColor: Colors.black26,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            filled: true,
                            labelStyle: TextStyle(
                                color: Colors.black54, fontSize: 10.0),
                            labelText: 'Email',
                            icon: Icon(
                              Icons.email,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      //clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        cursorColor: Colors.black26,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            filled: true,
                            labelStyle: TextStyle(
                                color: Colors.black54, fontSize: 10.0),
                            labelText: 'Password',
                            icon: Icon(
                              Icons.password,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      //clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: TextField(
                        obscureText: true,
                        controller: confirmpassController,
                        cursorColor: Colors.black26,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            filled: true,
                            labelStyle: TextStyle(
                                color: Colors.black54, fontSize: 10.0),
                            labelText: 'Confirm Password',
                            icon: Icon(
                              Icons.password,
                              color: Colors.black,
                            )),
                        onChanged: (value) {
                          if (confirmpassController.text !=
                              passwordController.text) {
                            setState(() {
                              error = 'error';
                            });
                          } else {
                            setState(() {
                              error = null;
                            });
                          }
                        },
                      ),
                    ),
                    /*  const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      //clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: TextField(
                        controller: idControler,
                        cursorColor: Colors.black26,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            filled: true,
                            labelStyle:
                                TextStyle(color: Colors.black54, fontSize: 10.0),
                            labelText: 'ID Number',
                            icon: Icon(
                              Icons.numbers_outlined,
                              color: Colors.black,
                            )),
                      ),
                    ), */
                    /*  const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      //clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),

                      child: /* DropdownButton<String>(
                        value: selectedItem,
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ))
                            .toList(),
                        onChanged: (item) => setState(() => selectedItem = item),
                      ),  */
                          TextField(
                        controller: categoryController,
                        cursorColor: Colors.black26,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            filled: true,
                            labelStyle:
                                TextStyle(color: Colors.black54, fontSize: 10.0),
                            labelText: 'Category',
                            icon: Icon(
                              Icons.numbers,
                              color: Colors.black,
                            )),
                      ),
                    ), */
                    const SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      //clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: TextField(
                        controller: appointedAsController,
                        cursorColor: Colors.black26,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            filled: true,
                            labelStyle: TextStyle(
                                color: Colors.black54, fontSize: 10.0),
                            labelText: 'Appointed As',
                            icon: Icon(
                              Icons.work,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      //clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: TextField(
                        controller: contactnumberController,
                        cursorColor: Colors.black26,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            filled: true,
                            labelStyle: TextStyle(
                                color: Colors.black54, fontSize: 10.0),
                            labelText: 'Contact No',
                            icon: Icon(
                              Icons.phone_callback,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 300),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.blue.shade400,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 160,
                      height: 50,
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      //clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: TextButton(
                          //fireStore eke user collection ekak create krla ita adalawa aluthen add wena userslage details add kirima
                          onPressed: () {
                            if (emailController.text.isNotEmpty &&
                                userNameController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty &&
                                appointedAsController.text.isNotEmpty &&
                                confirmpassController.text.isNotEmpty) {
                              fs.collection('user').doc().set({
                                'email': emailController.text.trim(),
                                'time': DateTime.now(),
                                'username': userNameController.text,
                                'password': passwordController.text,
                                'appointedAsController':
                                    appointedAsController.text,
                                'contactnumber':
                                    contactnumberController.toString(),
                              });
                              //............................................................^

                              //aluthin add wena user ge firebase authentication set kirima, email and password
                              auth.createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                              //..................................................^
                              emailController.clear();
                              userNameController.clear();
                              passwordController.clear();

                              appointedAsController.clear();

                              confirmpassController.clear();
                              contactnumberController.clear();
                            }
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInPage(),
                              ),
                            );
                            /*

                            Navigator.pop(context); //close navigation drawer before
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FirebaseChatroomExample()));

                                        */
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 200,
              height: 30,
              padding: const EdgeInsets.only(left: 50, right: 50),
              //clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: TextButton(
                  onPressed: () {
                    //............................................................^
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Go Back",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}





/*
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;
  final fs = FirebaseFirestore.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('user');

  final userNameController = new TextEditingController();
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final TextEditingController confirmpassController =
      new TextEditingController();
  final idControler = new TextEditingController();
  final categoryController = new TextEditingController();
  final appointedAsController = new TextEditingController();
  final unitController = new TextEditingController();
  final contactnumberController = new TextEditingController();
//////////////////////////////////////////////////////////////////
  List<String> items = [
    'Consultant',
    'Doctor',
    'Nurse',
    'Attendent',
    'Pharmacist',
    'Administrator'
  ];
  String? selectedItem = 'Consultant';
//////////////////////////////////////////
  var error = null;

  register(String email, String password) async {
    if (error == null) {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignInPage()));
      });
    } else {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.shade700,
      body: SingleChildScrollView(
        child: Card(
          color: Colors.grey.shade200,
          margin: const EdgeInsets.only(
              left: 0.0, right: 0.0, top: 0.0, bottom: 100),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(140),
                  bottomRight: Radius.circular(140))),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 50, right: 50, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create Your Account",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  "&",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text("Sign In",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: TextField(
                    controller: userNameController,
                    cursorColor: Colors.black26,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        filled: true,
                        labelStyle:
                            TextStyle(color: Colors.black54, fontSize: 10.0),
                        labelText: 'User Name',
                        icon: Icon(
                          Icons.person,
                          color: Colors.black,
                        )),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: TextField(
                    controller: emailController,
                    cursorColor: Colors.black26,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        filled: true,
                        labelStyle:
                            TextStyle(color: Colors.black54, fontSize: 10.0),
                        labelText: 'Email',
                        icon: Icon(
                          Icons.email,
                          color: Colors.black,
                        )),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    cursorColor: Colors.black26,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        filled: true,
                        labelStyle:
                            TextStyle(color: Colors.black54, fontSize: 10.0),
                        labelText: 'Password',
                        icon: Icon(
                          Icons.password,
                          color: Colors.black,
                        )),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: TextField(
                    controller: confirmpassController,
                    cursorColor: Colors.black26,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        filled: true,
                        labelStyle:
                            TextStyle(color: Colors.black54, fontSize: 10.0),
                        labelText: 'Confirm Password',
                        icon: Icon(
                          Icons.password,
                          color: Colors.black,
                        )),
                    onChanged: (value) {
                      if (confirmpassController.text !=
                          passwordController.text) {
                        setState(() {
                          error = 'error';
                        });
                      } else {
                        setState(() {
                          error = null;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: TextField(
                    controller: idControler,
                    cursorColor: Colors.black26,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        filled: true,
                        labelStyle:
                            TextStyle(color: Colors.black54, fontSize: 10.0),
                        labelText: 'ID Number',
                        icon: Icon(
                          Icons.numbers,
                          color: Colors.black,
                        )),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),

                  child: /* DropdownButton<String>(
                    value: selectedItem,
                    items: items
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(fontSize: 12),
                              ),
                            ))
                        .toList(),
                    onChanged: (item) => setState(() => selectedItem = item),
                  ),  */
                      TextField(
                    controller: categoryController,
                    cursorColor: Colors.black26,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        filled: true,
                        labelStyle:
                            TextStyle(color: Colors.black54, fontSize: 10.0),
                        labelText: 'Category',
                        icon: Icon(
                          Icons.numbers,
                          color: Colors.black,
                        )),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: TextField(
                    controller: appointedAsController,
                    cursorColor: Colors.black26,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        filled: true,
                        labelStyle:
                            TextStyle(color: Colors.black54, fontSize: 10.0),
                        labelText: 'Appointed As',
                        icon: Icon(
                          Icons.numbers,
                          color: Colors.black,
                        )),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: TextField(
                    controller: unitController,
                    cursorColor: Colors.black26,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        filled: true,
                        labelStyle:
                            TextStyle(color: Colors.black54, fontSize: 10.0),
                        labelText: 'Unit',
                        icon: Icon(
                          Icons.numbers,
                          color: Colors.black,
                        )),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: TextField(
                    controller: contactnumberController,
                    cursorColor: Colors.black26,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                        filled: true,
                        labelStyle:
                            TextStyle(color: Colors.black54, fontSize: 10.0),
                        labelText: 'Contact No',
                        icon: Icon(
                          Icons.numbers,
                          color: Colors.black,
                        )),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 300),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.redAccent.shade700,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: 160,
                  height: 50,
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Colors.redAccent.shade700,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  child: TextButton(
                      //fireStore eke user collection ekak create krla ita adalawa aluthen add wena userslage details add kirima
                      onPressed: () {
                        if (emailController.text.isNotEmpty &&
                            userNameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty &&
                            idControler.text.isNotEmpty &&
                            categoryController.text.isNotEmpty &&
                            appointedAsController.text.isNotEmpty &&
                            unitController.text.isNotEmpty &&
                            confirmpassController.text.isNotEmpty) {
                          fs.collection('user').doc().set({
                            'email': emailController.text.trim(),
                            'time': DateTime.now(),
                            'username': userNameController.text,
                            'password': passwordController.text,
                            'id': idControler.text,
                            'category': categoryController.text,
                            'appointedAsController': appointedAsController.text,
                            'unit': unitController.text,
                            'contactnumber': contactnumberController.toString(),
                          });
                          //............................................................^

                          //aluthin add wena user ge firebase authentication set kirima, email and password
                          auth.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text);
                          //..................................................^
                          emailController.clear();
                          userNameController.clear();
                          passwordController.clear();
                          categoryController.clear();
                          appointedAsController.clear();
                          unitController.clear();
                          confirmpassController.clear();
                          contactnumberController.clear();
                        }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                        );
                        /*

                        Navigator.pop(context); //close navigation drawer before
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const FirebaseChatroomExample()));

                                    */
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

*/