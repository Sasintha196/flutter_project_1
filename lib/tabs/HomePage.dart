import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_slt/mycheck/Ahistory.dart';
import 'package:flutter_application_slt/mycheck/Ghistory.dart';
import 'package:flutter_application_slt/people.dart';
import 'package:flutter_application_slt/tabs/Ac.dart';

import 'package:flutter_application_slt/tabs/generators.dart';

class HomePage extends StatefulWidget {
  String email;
  HomePage({required this.email});
  //const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState(email: email);
}

class _HomePageState extends State<HomePage> {
  String email;
  _HomePageState({required this.email});
  /*
  late ScrollController
      _scrollController; //Scroll kirimedi hide wena bottom navigation bar 1k sadaha

  @override //Scroll kirimedi hide wena bottom navigation bar 1k sadaha
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override //Scroll kirimedi hide wena bottom navigation bar 1k sadaha
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }  */

  //int index = 0; //bottom navigation bar item select kiriata adalawa
  //List<Widget> tabs = []; //bottom navigation bar item select kiriata adalawa
  //late Widget page; //bottom navigation bar item select kiriata adalawa
  // bool pageAssigned = false; //bottom navigation bar item select kiriata adalawa

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance
        .currentUser!; // dn log wela inna(current) userva User variable 1 ta set kirima................v
    //tabs.add(
    //    const Firstpage()); //bottom navigation bar item select kiriata adalawa
    //tabs.add(
    //    const UserAccount()); //bottom navigation bar item select kiriata adalawa

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          centerTitle: true,
          title: const Text("SLT MOBITEL",
              style: TextStyle(color: Color.fromARGB(227, 255, 255, 255))),
          //titleTextStyle: const TextStyle(fontSize: 20.0,),
          backgroundColor: const Color.fromARGB(83, 238, 176, 105)),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            // child kiynne eka widget 1i, children kiynne widget kipyak plwn. eka array ekak lesa enne
            //const DrawerHeader(
            // child: Text('Drawer Header'),
            // decoration: BoxDecoration(
            //   color: Color.fromARGB(255, 245, 113, 4),
            // ),
            //),
            UserAccountsDrawerHeader(
              accountName: const Text("Sasintha Dilan",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              accountEmail: Text(user.email!,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255))),
              /*  currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/image23.jpg",
                ),
              ), */
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('Notifications',
                  style: TextStyle(
                      color: Colors.lightBlue, fontWeight: FontWeight.bold)),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('All History of Generator',
                  style: TextStyle(
                      color: Colors.lightBlue, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context); //close navigation drawer before
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Ghistory()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('All History of Ac',
                  style: TextStyle(
                      color: Colors.lightBlue, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context); //close navigation drawer before
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Ahistory()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('Users',
                  style: TextStyle(
                      color: Colors.lightBlue, fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pop(context); //close navigation drawer before
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),

            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('Table',
                  style: TextStyle(color: Color.fromARGB(255, 122, 6, 255))),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 5.0,
              height: 60,
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: Text(
                "LogOut",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: Colors.pinkAccent.shade400,
            ),

/*
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(10),
                minimumSize: const Size(10, 10),
              ),
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: const Text('Sign-Out'),
            ),
*/
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 200,
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/image6.jpg",
                      ),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        //............................................................^
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Generators(),
                          ),
                        );
                      },
                      child: Text(
                        "",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 300,
                  height: 200,
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  //clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/image7.jpg",
                      ),
                    ),
                  ),
                  child: TextButton(
                      onPressed: () {
                        //............................................................^
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Ac(),
                          ),
                        );
                      },
                      child: Text(
                        "",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),

      /* ShaderMask(
        //background eke colors set kiriata adalawa
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Colors.grey,
            Color.fromARGB(255, 0, 63, 56),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
        ).createShader(bounds),
        blendMode: BlendMode.softLight,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          //................................................................
          /* decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/image21.jpg",
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            ),
          ), */
          //.............................................................................
          child: SingleChildScrollView(
            /* controller:
                _scrollController, //Scroll kirimedi hide wena bottom navigation bar 1k sadaha  */
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                //...............................
                const ImagePage(),
                //..................................
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 50,
                ),
                //.............................
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text("Generator",
                                    style: TextStyle(
                                        backgroundColor: Colors.white10,
                                        wordSpacing: 5,
                                        color:
                                            Color.fromARGB(227, 255, 255, 255)),
                                    textScaleFactor: 1.1),
                                const SizedBox(
                                  height: 5,
                                ),
                                //......................................
                                //image
                                Material(
                                  borderRadius: BorderRadius.circular(30),
                                  elevation: 0,
                                  shadowColor: Colors.white,
                                  child: Container(
                                    height: 200,
                                    width: 300,
                                    //margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: const DecorationImage(
                                        fit: BoxFit.scaleDown,
                                        image: AssetImage("assets/image6.jpg"),
                                      ),
                                    ),
                                  ),
                                ),
                                //.......................................................
                              ],
                            ),

                            //..................................................................mekath hari
                            /*  Container(
                        height: 100,
                        width: 200,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image3.jpg"),
                          ),
                        ),
                      ), */
                            //...............................................................
                            IconButton(
                              highlightColor:
                                  const Color.fromARGB(255, 233, 252, 150),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Generators()));
                              },
                              icon: const Icon(
                                Icons.navigate_next,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        /*  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text("StandBy generator",
                                    style: TextStyle(
                                        backgroundColor: Colors.white10,
                                        wordSpacing: 5,
                                        color:
                                            Color.fromARGB(227, 255, 255, 255)),
                                    textScaleFactor: 1.1),
                                const SizedBox(
                                  height: 5,
                                ),
                                //......................................
                                //image
                                Material(
                                  borderRadius: BorderRadius.circular(30),
                                  elevation: 0,
                                  shadowColor: Colors.white,
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    //margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: const DecorationImage(
                                        fit: BoxFit.scaleDown,
                                        image: AssetImage("assets/image6.jpg"),
                                      ),
                                    ),
                                  ),
                                ),
                                //.......................................................
                              ],
                            ),
                            IconButton(
                              highlightColor:
                                  const Color.fromARGB(255, 233, 252, 150),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const StandByGeneratorHomePage()));
                              },
                              icon: const Icon(
                                Icons.navigate_next,
                                size: 30,
                              ),
                            ),
                          ],
                        ), */

                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text("Ac",
                                    style: TextStyle(
                                        backgroundColor: Colors.white10,
                                        wordSpacing: 5,
                                        color:
                                            Color.fromARGB(227, 255, 255, 255)),
                                    textScaleFactor: 1.1),
                                const SizedBox(
                                  height: 5,
                                ),
                                //......................................
                                //image
                                Material(
                                  borderRadius: BorderRadius.circular(30),
                                  elevation: 0,
                                  shadowColor: Colors.white,
                                  child: Container(
                                    height: 200,
                                    width: 300,
                                    //margin: const EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: const DecorationImage(
                                        //scale: 1,
                                        fit: BoxFit.scaleDown,
                                        image: AssetImage("assets/image7.jpg"),
                                      ),
                                    ),
                                  ),
                                ),
                                //.......................................................
                              ],
                            ),

                            //..................................................................mekath hari
                            /*  Container(
                        height: 100,
                        width: 200,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image3.jpg"),
                          ),
                        ),
                      ), */
                            //...............................................................
                            IconButton(
                              highlightColor:
                                  const Color.fromARGB(255, 233, 252, 150),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Ac()));
                              },
                              icon: const Icon(
                                Icons.navigate_next,
                                size: 30,
                              ),

                              /*const Text("PORTABLE GENERATORS",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                  color: Color.fromARGB(134, 0, 0, 0))), */
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),

*/

      //................................................................................

      // Scroll kirimedi hide wena bottom navigation bar 1k sadaha,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
      /* bottomNavigationBar: AnimatedBuilder(
        animation: _scrollController,
        builder: (context, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 60),
            // height: _scrollController.position.userScrollDirection ==
            //     ScrollDirection.reverse
            //    ? 0
            //   : 100,
            child: child,
          );
        },
        child: BottomNavigationBar(
            iconSize: 0,
            backgroundColor: const Color.fromARGB(83, 238, 176, 105),
             currentIndex: index,
             onTap: (i) {
              setState(() {
               index = i;
                pageAssigned = false;
              });
              },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'FIRST PAGE',
                  backgroundColor: Color.fromARGB(120, 23, 228, 143)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'USER ACCOUNT',
                  backgroundColor: Color.fromARGB(118, 40, 185, 64)),
            ]),  
      ),  */
      //,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
    );
  }

  /* Widget setupAlertDialoadContainer(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.grey,
          height: 300.0, // Change as per your requirement
          width: 300.0, // Change as per your requirement
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('List Item $index'),
                )),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
        )
      ],
    );
  } */
}
