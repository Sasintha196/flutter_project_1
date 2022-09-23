import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_slt/mycheck/Ahistory.dart';

import 'package:flutter_application_slt/target/AddAc.dart';
import 'package:intl/intl.dart';

import 'package:expandable/expandable.dart';

class AcHomePage extends StatefulWidget {
  const AcHomePage({Key? key}) : super(key: key);

  @override
  _AcHomePageState createState() => _AcHomePageState();
}

class _AcHomePageState extends State<AcHomePage> {
// alert eke data display wimata adalawa textFormField 2ke controler mention kirima
  //TextEditingController txtAmount = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtDescriptionedit = TextEditingController();
  DateTime? date1;
  DateTime? date2;
  DateTime? date3;
  DateTime? date4;

// database eka ha sambandawimata adalawa mention krnne
  final Stream<QuerySnapshot> _addacStream =
      FirebaseFirestore.instance.collection("addac").snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 82, 74),
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Ac",
              style: TextStyle(color: Color.fromARGB(227, 255, 255, 255))),
          //titleTextStyle: const TextStyle(fontSize: 20.0,),
          backgroundColor: const Color.fromARGB(82, 100, 255, 219)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AddAc()));
        }, //press karama wenna ona de {} athule liyanna
        child: const Icon(
            Icons.add), // floating action button eka athule tyna icon eka
      ),
      /* drawer: Drawer(
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
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? const Color.fromARGB(255, 20, 9, 177)
                        : const Color.fromARGB(255, 70, 4, 252),
                child: const Text(
                  "image",
                  style: TextStyle(fontSize: 20.0),
                ),
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
      ), */

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 30),
        child: ListView(
          shrinkWrap: true,
          children: [
            buildCard(),
          ],
        ),
      ),

      // mehema karama expanded wechcha expansion panel hadenne
      /* body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
        // StreamBuilder kiyanne database eken data gena function eka
        child: StreamBuilder<QuerySnapshot>(
          stream: _addacStream,
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

            /*    //expansion panel 1k set kirimata try kirimata adalawa
              List<bool> _isOpen;
            return ExpansionPanelList(
              animationDuration: const Duration(seconds: 2),
              dividerColor: Colors.black,
              elevation: 1,
              expandedHeaderPadding: const EdgeInsets.all(5),
              children: [
                ExpansionPanel(
                  isExpanded: _isOpen[0],
                    canTapOnHeader: true,
                    headerBuilder: Text("Ac 1"),
                    body: ),
                    ExpansionPanel(
                  isExpanded: _isOpen[1],
                    canTapOnHeader: true,
                    headerBuilder: ,
                    body: ),
              ],
              expansionCallback: (i, isOpen) =>
                  setState(() => _isOpen[i] = !isOpen),
            );  */
          //....................................................................................................................................................
            return ExpansionPanelList(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                dynamic data = document.data();

                //....................................dates display kirimedi format 1 set karaganimata adalawa.................
                Timestamp buy = data[
                    'date_a1']; // Timestamp(seconds=1624653319,nanoseconds=326000000)
                DateTime buydate = buy.toDate();
                //print(d.toString());
                Timestamp last = data['last_modify_date_a1'];
                DateTime lastdate = last.toDate();
                Timestamp next = data['next_modify_date_a1'];
                DateTime nextdate = next.toDate();
                //....................................................................................................................
                return ExpansionPanel(
                  
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: const EdgeInsets.all(
                            11.0), // hathara pattatama set wena paridi padding kirima
                        child: Column(
                          children: [
                            Text(
                              data['name_a1'].toString(),
                              style: const TextStyle(
                                  backgroundColor:
                                      Color.fromARGB(66, 156, 156, 156),
                                  wordSpacing: 7,
                                  color: Color.fromARGB(255, 0, 0, 0)),
                              textScaleFactor: 1.1,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Serial No : " +
                                  data['serial_number_a1'].toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(169, 0, 0, 0)),
                              textScaleFactor: 0.9,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Buy Date : " +
                                  DateFormat('yyyy-MM-dd KK:mm:ss a')
                                      .format(buydate),
                              style: const TextStyle(
                                  wordSpacing: 6,
                                  color: Color.fromARGB(160, 0, 0, 0)),
                              textScaleFactor: 0.7,
                            ),
                            const Divider(),
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
                          Text(
                            "Last Modified Date : " +
                                DateFormat('yyyy-MM-dd KK:mm:ss a')
                                    .format(lastdate),
                            style: const TextStyle(
                                backgroundColor: Colors.white10,
                                wordSpacing: 5,
                                color: Color.fromARGB(255, 0, 118, 253)),
                            textScaleFactor: 0.7,
                          ),
                          const Divider(),
                          Text(
                            "Description: " + data['description_a1'].toString(),
                            style: const TextStyle(
                                // backgroundColor: Colors.white10,
                                wordSpacing: 4,
                                color: Color.fromARGB(255, 42, 85, 70)),
                            textScaleFactor: 0.8,
                          ),
                          const Divider(),
                          Text(
                            "Next Modify Date : " +
                                DateFormat('yyyy-MM-dd KK:mm:ss a')
                                    .format(nextdate),
                            style: const TextStyle(
                                backgroundColor: Colors.white10,
                                wordSpacing: 5,
                                color: Color.fromARGB(255, 0, 118, 253)),
                            textScaleFactor: 0.7,
                          ),
                          const Divider(),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit_note),
                                // splashColor:
                                // const Color.fromARGB(255, 8, 219, 54),
                                highlightColor:
                                    const Color.fromARGB(171, 0, 255, 21),
                                color: const Color.fromARGB(228, 219, 152, 26),
                                onPressed: () {
                                  String acEditId = document.id;
                                  _showMyEditableDialog(acEditId);
                                },
                              ),
                              const SizedBox(
                                width: 115,
                              ),
                              IconButton(
                                icon: const Icon(Icons.history),
                                // splashColor:
                                // const Color.fromARGB(255, 8, 219, 54),
                                highlightColor:
                                    const Color.fromARGB(171, 0, 255, 21),
                                color: const Color.fromARGB(228, 219, 152, 26),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AcHistory()));
                                },
                              ),
                              const SizedBox(
                                width: 115,
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward),
                                // splashColor:
                                // const Color.fromARGB(255, 8, 219, 54),
                                highlightColor:
                                    const Color.fromARGB(171, 0, 255, 21),
                                color: const Color.fromARGB(186, 10, 73, 2),
                                onPressed: () {
                                  String name = data['name_a1'].toString();
                                  String acId = document
                                      .id; //alert eken database 1 haraha labaganna targetid eka laba deema.
                                  _showMyDialog(acId,
                                      name); // alert ekata adala object/function name eka thama methana call krnne
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    isExpanded: true,
                    backgroundColor: const Color.fromARGB(242, 242, 243, 236));
              }).toList(),
              expansionCallback: (i, isOpen) =>
              setState(() =>
                  _isOpen[i] = !isOpen              
               ),
            );
          },
        ),
      ), */
    );
  }

  Widget buildCard() => ExpandableNotifier(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: ScrollOnExpand(
              child: ExpandablePanel(
                  header: Card(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _addacStream,
                      builder: (BuildContext contet,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        return ListView(
                            shrinkWrap: true,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              return Column(
                                children: [
                                  Text("RSU : " + document['rsu'].toString()),
                                ],
                              );
                            }).toList());
                      },
                    ),
                  ),
                  collapsed: Card(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _addacStream,
                      builder: (BuildContext contet,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        return ListView(
                            //scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Availability : " +
                                          document['availability'].toString()),
                                      Text("Type : " +
                                          document['type'].toString()),
                                    ],
                                  )
                                ],
                              );
                            }).toList());
                      },
                    ),
                  ),
                  expanded: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [_dataRetrieve()],
                    ),

                    /*Text(
                      List.generate(5, (_) =>  secondpage()).join('\n\n'),
                    ), */
                  )),
            ),
          ),
        ),
      );

  Widget _dataRetrieve() {
    return Card(
      // height: 300,
      // width: 300,
      //height: MediaQuery.of(context).size.height, // container eke usa
      child: StreamBuilder<QuerySnapshot>(
        stream: _addacStream,
        builder: (BuildContext contet, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went Wrong!");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              //SizeBox wenuwata tibbe Container
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
              // "center" danne display eke madin loading wena eka display krnna
              //const Text("Loading..."), kiyala dammoth "loading.."" kiyala display wenawa
            );
          }

          return ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Timestamp buy = document[
                    'date_a1']; // Timestamp(seconds=1624653319,nanoseconds=326000000)
                DateTime buydate = buy.toDate();
                //print(d.toString());
                Timestamp last = document['last_modify_date_a1'];
                DateTime lastdate = last.toDate();
                Timestamp next = document['next_modify_date_a1'];
                DateTime nextdate = next.toDate();

                return Column(
                  children: [
                    Text(
                      document['name_a1'].toString(),
                      style: const TextStyle(
                          backgroundColor: Color.fromARGB(66, 156, 156, 156),
                          wordSpacing: 7,
                          color: Color.fromARGB(255, 0, 0, 0)),
                      textScaleFactor: 1.1,
                    ),
                    Text(
                      "Serial No : " + document['serial_number_a1'].toString(),
                      style:
                          const TextStyle(color: Color.fromARGB(169, 0, 0, 0)),
                      textScaleFactor: 0.9,
                    ),
                    Text(
                      "Buy Date : " +
                          DateFormat('yyyy-MM-dd KK:mm:ss a').format(buydate),
                      style: const TextStyle(
                          wordSpacing: 6, color: Color.fromARGB(160, 0, 0, 0)),
                      textScaleFactor: 0.7,
                    ),
                    Text(
                      "Last Modified Date : " +
                          DateFormat('yyyy-MM-dd KK:mm:ss a').format(lastdate),
                      style: const TextStyle(
                          backgroundColor: Colors.white10,
                          wordSpacing: 5,
                          color: Color.fromARGB(255, 0, 118, 253)),
                      textScaleFactor: 0.7,
                    ),
                    Text(
                      "Next Modify Date : " +
                          DateFormat('yyyy-MM-dd KK:mm:ss a').format(nextdate),
                      style: const TextStyle(
                          backgroundColor: Colors.white10,
                          wordSpacing: 5,
                          color: Color.fromARGB(255, 0, 118, 253)),
                      textScaleFactor: 0.7,
                    ),
                    Text(
                      "Description: " + document['description_a1'].toString(),
                      style: const TextStyle(
                          // backgroundColor: Colors.white10,
                          wordSpacing: 4,
                          color: Color.fromARGB(255, 42, 85, 70)),
                      textScaleFactor: 0.8,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit_note),
                          // splashColor:
                          // const Color.fromARGB(255, 8, 219, 54),
                          highlightColor: const Color.fromARGB(171, 0, 255, 21),
                          color: const Color.fromARGB(228, 219, 152, 26),
                          onPressed: () {
                            String acEditId = document.id;
                            _showMyEditableDialog(acEditId);
                          },
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        IconButton(
                          icon: const Icon(Icons.history),
                          // splashColor:
                          // const Color.fromARGB(255, 8, 219, 54),
                          highlightColor: const Color.fromARGB(171, 0, 255, 21),
                          color: const Color.fromARGB(228, 219, 152, 26),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Ahistory()));
                          },
                        ),
                        const SizedBox(
                          width: 110,
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          // splashColor:
                          // const Color.fromARGB(255, 8, 219, 54),
                          highlightColor: const Color.fromARGB(171, 0, 255, 21),
                          color: const Color.fromARGB(186, 10, 73, 2),
                          onPressed: () {
                            String name = document['name_a1'].toString();
                            String acId = document
                                .id; //alert eken database 1 haraha labaganna targetid eka laba deema.
                            _showMyDialog(acId,
                                name); // alert ekata adala object/function name eka thama methana call krnne
                          },
                        )
                      ],
                    ),
                  ],
                );
              }).toList());
        },
      ),
    );
  }

// alert ekak display wena object eka. meka _HomePageState class eka athule build object ekata pitin aluth object 1k wdyata thama add krnne
  // ignore: unused_element
  Future<void> _showMyDialog(acId, name) async {
    // targetId kiyala variable 1k danne alert ekedi add karana contribution data, tika koi target eke contribution eka widiyatada add wenna one kiyana eka set krnna.
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // user must tap button! / user button eka click karnaknma alert eka ain wenne ne. meka true karoth screen eke wena thanaka touch karath alert eka ain wenwa
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            name,
            style: const TextStyle(
                //backgroundColor: Color.fromARGB(66, 156, 156, 156),
                wordSpacing: 5,
                color: Colors.green),
            textScaleFactor: 1.0,
          ),
          // "const" kiyanne eke agayan(values) wenas wenne nathi wenna ona.
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                  'Enter reparing details',
                  style: TextStyle(color: Colors.amber),
                  textScaleFactor: 1.1,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Enter Date :',
                  textScaleFactor: 0.9,
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //async kiyanne nawathila inna plwn jathiye object 1k kiyana eka
                    date1 = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2500)))!;
                  },
                  child: const Text("Select a Date"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Enter Description :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  maxLength: 30,
                  controller: txtDescription,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Enter Next modify Date :',
                  textScaleFactor: 0.9,
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //async kiyanne nawathila inna plwn jathiye object 1k kiyana eka
                    date2 = (await showDatePicker(
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
                  child:
                      const Text('OK', style: TextStyle(color: Colors.green)),
                  onPressed: () {
                    // "Navigator.of(context).pop();" meken krnne button 1 press krama popup alert eka nikanma ain wena eka. e kiynne nkn ignor button 1k add krnna plwn zn 1k.
                    String description = txtDescription.text;
                    //database ekata data ekak insert karana code eka
                    FirebaseFirestore.instance
                        .collection("repairac") //"contributions"
                        .add({
                      'name_of_repairing_ac': name,
                      'last_modify_date_a': date1,
                      'next_modify_date_a': date2,
                      'description_a': description,
                      'ac_id': acId,
                    });

                    //database eke data update karana code kotasak
                    // mehidi "targets" table eke "contribution_tota" kiyana document eka thama update krnne.
                    FirebaseFirestore.instance
                        .collection('addac')
                        .doc(acId)
                        .update({
                      'last_modify_date_a1': date1,
                      'description_a1': description,
                      'next_modify_date_a1': date2,

                      //mehidi tiyana contribution total value ekatama aluth contribution eka ekathu wela update wenna ona nisai "FieldValue.increment()" use krnne.
                      // delete krnna onenm "FieldValue.delete()" wage wenas kra kra update kirim krnna plwn
                    });
                    date1 = null;
                    txtDescription.text = "";
                    // txtAmount.clear(); use krnnath plwn
                    date2 = null;
                    //txtNote.clear(); use krnnath plwn
                    Navigator.of(context)
                        .pop(); // popup eka remove krnwa display eken
                  },
                ),
                TextButton(
                  onPressed: () {
                    date1 = null;
                    txtDescription.text = "";
                    date2 = null;
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  //...........................................................................................................
  Future<void> _showMyEditableDialog(acEditId) async {
    // targetId kiyala variable 1k danne alert ekedi add karana contribution data, tika koi target eke contribution eka widiyatada add wenna one kiyana eka set krnna.
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // user must tap button! / user button eka click karnaknma alert eka ain wenne ne. meka true karoth screen eke wena thanaka touch karath alert eka ain wenwa
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Update Repairing Details',
            style: TextStyle(color: Colors.amber),
          ), // "const" kiyanne eke agayan(values) wenas wenne nathi wenna ona.
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                  'Update Date',
                  textScaleFactor: 0.9,
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //async kiyanne nawathila inna plwn jathiye object 1k kiyana eka
                    date3 = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2500)))!;
                  },
                  child: const Text("Select a Date"),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Update Description :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtDescriptionedit,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Update Next modify Date',
                  textScaleFactor: 0.9,
                ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  onPressed: () async {
                    //async kiyanne nawathila inna plwn jathiye object 1k kiyana eka
                    date4 = (await showDatePicker(
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
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () {
                    // "Navigator.of(context).pop();" meken krnne button 1 press krama popup alert eka nikanma ain wena eka. e kiynne nkn ignor button 1k add krnna plwn zn 1k.
                    String descriptionedit = txtDescriptionedit.text;

                    //database eke data update karana code kotasak
                    // mehidi "targets" table eke "contribution_tota" kiyana document eka thama update krnne.
                    FirebaseFirestore.instance
                        .collection('repairac')
                        .doc('8ZiBvtgYnJvAAnNszbKh')
                        .update({
                      'last_modify_date_a': date3,
                      'description_a': descriptionedit,
                      'next_modify_date_a': date4,

                      //mehidi tiyana contribution total value ekatama aluth contribution eka ekathu wela update wenna ona nisai "FieldValue.increment()" use krnne.
                      // delete krnna onenm "FieldValue.delete()" wage wenas kra kra update kirim krnna plwn
                    });
                    FirebaseFirestore.instance
                        .collection('addac')
                        .doc(acEditId)
                        .update({
                      'last_modify_date_a1': date3,
                      'description_a1': descriptionedit,
                      'next_modify_date_a1': date4,

                      //mehidi tiyana contribution total value ekatama aluth contribution eka ekathu wela update wenna ona nisai "FieldValue.increment()" use krnne.
                      // delete krnna onenm "FieldValue.delete()" wage wenas kra kra update kirim krnna plwn
                    });
                    date3 = null;
                    txtDescriptionedit.text = "";
                    // txtAmount.clear(); use krnnath plwn
                    date4 = null;
                    //txtNote.clear(); use krnnath plwn
                    Navigator.of(context)
                        .pop(); // popup eka remove krnwa display eken
                  },
                ),
                TextButton(
                  onPressed: () {
                    date3 = null;
                    txtDescriptionedit.text = "";
                    date4 = null;
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
