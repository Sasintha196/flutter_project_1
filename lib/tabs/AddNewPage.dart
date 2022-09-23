import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({Key? key}) : super(key: key);

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  TextEditingController txtSerialNumber = TextEditingController();
  TextEditingController txtName = TextEditingController();
  DateTime? date;

  final Stream<QuerySnapshot> _addportablegeneratorStream =
      FirebaseFirestore.instance.collection("addportablegenerator").snapshots();
  //final Stream<QuerySnapshot> _addstandbygeneratorStream =
  // FirebaseFirestore.instance.collection("addportablegenerator").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("ADD NEW DEVICE",
              style: TextStyle(color: Color.fromARGB(227, 255, 255, 255))),
          //titleTextStyle: const TextStyle(fontSize: 20.0,),
          backgroundColor: const Color.fromARGB(181, 80, 238, 172)),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            // child kiynne eka widget 1i, children kiynne widget kipyak plwn. eka array ekak lesa enne
            //const DrawerHeader(
            // child: Text('Drawer Header'),
            // decoration: BoxDecoration(
            //   color: Color.fromARGB(255, 245, 113, 4),
            // ),
            //),
            UserAccountsDrawerHeader(
              accountName: const Text("Sasintha Dilan"),
              accountEmail: const Text("sasinthadilan@gmail.com"),
              currentAccountPicture: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image2.png"))),
              ),
            ),
            ListTile(
              title: const Text('sign-in'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('sign-out'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        // StreamBuilder kiyanne database eken data gena function eka
        child: StreamBuilder<QuerySnapshot>(
          stream: _addportablegeneratorStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              //print('Tou hae an error! ${snapshot.error.toString()}');
              return const Text('Something went wrong');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                // "center" danne display eke madin loading wena eka display krnna
                //const Text("Loading..."), kiyala dammoth "loading.."" kiyala display wenawa
                child: CircularProgressIndicator(),
              );
            }

            return ExpansionPanelList(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: const EdgeInsets.all(
                            11.0), // hathara pattatama set wena paridi padding kirima
                        child: Column(
                          children: const [
                            Text(
                              " ",
                              textScaleFactor: 1.0,
                            ),
                            Text(
                              " ",
                              textScaleFactor: 1.0,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      );
                    },
                    body: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        /*  mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, */ //ekama row eke data athara ida wen kirima
                        children: [
                          const Text(
                            "ADD NEW",
                            textScaleFactor: 0.9,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            splashColor: const Color.fromARGB(255, 91, 77, 219),
                            highlightColor:
                                const Color.fromARGB(255, 232, 247, 100),
                            color: const Color.fromARGB(255, 7, 27, 95),
                            onPressed: () {
                              String portableId = document
                                  .id; //alert eken database 1 haraha labaganna targetid eka laba deema.
                              _showMyDialog(
                                  portableId); // alert ekata adala object/function name eka thama methana call krnne
                            },
                          )
                        ],
                      ),
                    ),
                    isExpanded: true,
                    backgroundColor: const Color.fromARGB(248, 207, 247, 203));
              }).toList(),
            );
          },
        ),
      ),
    );
  }

//..........................................................................................................................................................................................

  Future<void> _showMyDialog(portableId) async {
    // targetId kiyala variable 1k danne alert ekedi add karana contribution data, tika koi target eke contribution eka widiyatada add wenna one kiyana eka set krnna.
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // user must tap button! / user button eka click karnaknma alert eka ain wenne ne. meka true karoth screen eke wena thanaka touch karath alert eka ain wenwa
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
              'ADD NEW PORTABLE GENERATOR'), // "const" kiyanne eke agayan(values) wenas wenne nathi wenna ona.
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                  'Enter Name',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtName,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Enter Serial Number',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtSerialNumber,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Enter Date',
                  textScaleFactor: 0.9,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //async kiyanne nawathila inna plwn jathiye object 1k kiyana eka
                    date = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2500)))!;
                  },
                  child: const Text("Select a Date"),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ButtonBar(
              children: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    // "Navigator.of(context).pop();" meken krnne button 1 press krama popup alert eka nikanma ain wena eka. e kiynne nkn ignor button 1k add krnna plwn zn 1k.
                    String name = txtName.text;
                    String snumber = txtSerialNumber.text;
                    //database ekata data ekak insert karana code eka
                    FirebaseFirestore.instance
                        .collection("addportablegenerator") //"contributions"
                        .add({
                      'name': name,
                      'serialnumber': snumber,
                      'date': date,
                      // 'standby_id': portableId
                    });

                    //database eke data update karana code kotasak
                    // mehidi "targets" table eke "contribution_tota" kiyana document eka thama update krnne.

                    date = null;
                    txtName.text = "";
                    txtSerialNumber.text = "";
                    // txtAmount.clear(); use krnnath plwn
                    //txtNote.clear(); use krnnath plwn
                    Navigator.of(context)
                        .pop(); // popup eka remove krnwa display eken
                  },
                ),
                TextButton(
                  onPressed: () {
                    date = null;
                    txtName.text = "";
                    txtSerialNumber.text = "";
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}


/*
import 'package:telecom/pages/target/AddAc.dart';
import 'package:telecom/pages/target/AddPortableGenerator.dart';
import 'package:telecom/pages/target/AddStandByGenerator.dart';

class AddNewPage extends StatelessWidget {
  const AddNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Page"),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
//........................................................................................................
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/image3.jpg"))),
//.............................................................................................................................................................................
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddAc()));
              },
              child: const Text("ADD AC"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPortableGenerator()));
              },
              child: const Text("ADD PORTABLE GENERATOR"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddStandByGenerator()));
              },
              child: const Text("ADD STAND BY GENERATOR"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddNewPage()));
              },
              child: const Text("Second Page"),
            ),
          ],
        ),
      ),
    );
  }
}

*/