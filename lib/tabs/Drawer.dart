import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Drawer extends StatelessWidget {
  final Padding = const EdgeInsets.symmetric(horizontal: 20);

  Drawer(SingleChildScrollView singleChildScrollView);

  @override
  Widget build(BuildContext context) {
    final User = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: const [
            Text("SriLanka Telecom",
                style: TextStyle(
                    // backgroundColor: Color.fromARGB(118, 48, 48, 48),
                    wordSpacing: 5,
                    color: Color.fromARGB(255, 255, 255, 255)),
                textScaleFactor: 1.3),
            Text(
              "polonnaruwa",
              style: TextStyle(
                  // backgroundColor: Color.fromARGB(118, 48, 48, 48),
                  wordSpacing: 5,
                  color: Color.fromARGB(255, 255, 255, 255)),
              textScaleFactor: 1,
            )
          ],
        ),

        centerTitle: true,
        //titleTextStyle: const TextStyle(fontSize: 20.0,),
        //backgroundColor: const Color.fromARGB(249, 143, 80, 9)
        backgroundColor: Colors.transparent,
        elevation: 20, // elevation 0 kirimen siyaluma shadow iwath wenawa
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.blueAccent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context); //close navigation drawer before
          },
          child: Container(
            padding: EdgeInsets.only(
                top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage(
                    "assets/image22.jpg",
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text('Sasintha Dilan',
                    style: TextStyle(fontSize: 28, color: Colors.white)),
                Text('dilansasintha@gmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16, //vertical spacing
          children: [
            /*  ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); //close navigation drawer before
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>  HomePage(email: email)));
              },
            ),  */
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Favourites'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.workspaces_outline),
              title: const Text('Workflow'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Updates'),
              onTap: () {},
            ),
          ],
        ),
      );
}
