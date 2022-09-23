import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/Aralaganvila.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/Dehiattakandiya.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/Hingurakgoda.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/Medirigiriya.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/Polonnaruwa.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/Pulasthigama.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/Welikanda.dart';

import 'package:flutter_application_slt/target/AddGenerator.dart';
import 'package:intl/intl.dart';

class Generators extends StatefulWidget {
  const Generators({Key? key}) : super(key: key);

  @override
  _GeneratorsState createState() => _GeneratorsState();
}

class _GeneratorsState extends State<Generators> {
// alert eke data display wimata adalawa textFormField 2ke controler mention kirima
  //TextEditingController txtAmount = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtDescriptionedit = TextEditingController();
  TextEditingController txtNeedReplace = TextEditingController();
  TextEditingController txtReason = TextEditingController();
  TextEditingController txtAnyOtherChangesIdentified = TextEditingController();
  TextEditingController txtNeedReplaceEdit = TextEditingController();
  TextEditingController txtReasonEdit = TextEditingController();
  TextEditingController txtAnyOtherChangesIdentifiedEdit =
      TextEditingController();
  //DateTime? date1;
  //DateTime? date2;
  //DateTime? date3;
  //DateTime? date4;

  String rsu = "";

  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();
  DateTime date3 = DateTime.now();
  DateTime date4 = DateTime.now();

// database eka ha sambandawimata adalawa mention krnne
  final Stream<QuerySnapshot> _addgeneratorStream = FirebaseFirestore.instance
      .collection("addgenerator")
      .orderBy('last_repaired_date_a', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                rsu = val;
              });
            },
          ),
        ),
      ),

      /* appBar: AppBar(
          centerTitle: true,
          title: const Text("Generators",
              style: TextStyle(
                  color: Color.fromARGB(227, 255, 255, 255),
                  fontWeight: FontWeight.w700)),
          //titleTextStyle: const TextStyle(fontSize: 20.0,),
          backgroundColor: Colors.lightBlue.shade300),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddGenerator()));
        }, //press karama wenna ona de {} athule liyanna
        child: const Icon(
            Icons.add), // floating action button eka athule tyna icon eka
      ),
      body:

          /* StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection('addgenerator').snapshots(),
        builder: (context, snapshots) {
          return ListView.builder(
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshots.data!.docs[index].data()
                        as Map<String, dynamic>;

                    String id = data.id;
                    rsu = data['rsu'];
                    String available = data['availability_a'].toString();
                    String make = data['make_a'].toString();
                    String changes =
                        data['any_other_changes_identified_a'].toString();
                    String automanual = data['auto_or_manual_a'].toString();
                    String capacity = data['capacity_a'].toString();
                    String description = data['description_a'].toString();
                    String replace = data['need_to_replace_a'].toString();
                    String reason = data['reason_a'].toString();

                    String type = data['type_a'].toString();
                    Timestamp last = data[
                        'last_repaired_date_a']; // Timestamp(seconds=1624653319,nanoseconds=326000000)
                    DateTime lastdate = last.toDate();
                    Timestamp next = data['next_repairing_date_a'];
                    DateTime nextdate = next.toDate();

                    if (rsu.isEmpty) {
                      return ListView(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: [
                                buildCard(
                                    rsu,
                                    available,
                                    type,
                                    id,
                                    changes,
                                    make,
                                    automanual,
                                    capacity,
                                    description,
                                    replace,
                                    reason,
                                    lastdate,
                                    nextdate),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                    if (data['rsu']
                        .toString()
                        .toLowerCase()
                        .startsWith(rsu.toLowerCase())) {
                      return ListView(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: [
                                buildCard(
                                    rsu,
                                    available,
                                    type,
                                    id,
                                    changes,
                                    make,
                                    automanual,
                                    capacity,
                                    description,
                                    replace,
                                    reason,
                                    lastdate,
                                    nextdate),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }
                    return Container();
                  });
        },
      ),   */

          StreamBuilder<QuerySnapshot>(
              stream: _addgeneratorStream,
              builder:
                  (BuildContext contet, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went Wrong!");
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
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
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      String id = document.id;
                      rsu = document['rsu'];
                      String available = document['availability_a'].toString();
                      String make = document['make_a'].toString();
                      String changes =
                          document['any_other_changes_identified_a'].toString();
                      String automanual =
                          document['auto_or_manual_a'].toString();
                      String capacity = document['capacity_a'].toString();
                      String description = document['description_a'].toString();
                      String replace = document['need_to_replace_a'].toString();
                      String reason = document['reason_a'].toString();

                      String type = document['type_a'].toString();
                      Timestamp last = document[
                          'last_repaired_date_a']; // Timestamp(seconds=1624653319,nanoseconds=326000000)
                      DateTime lastdate = last.toDate();
                      Timestamp next = document['next_repairing_date_a'];
                      DateTime nextdate = next.toDate();
                      return Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: buildCard(
                                rsu,
                                available,
                                type,
                                id,
                                changes,
                                make,
                                automanual,
                                capacity,
                                description,
                                replace,
                                reason,
                                lastdate,
                                nextdate),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      );
                    }).toList());
              }),
    );
  }

  Widget buildCard(rsu, available, type, id, changes, make, automanual,
          capacity, description, replace, reason, lastdate, nextdate) =>
      SingleChildScrollView(
        child: ExpandableNotifier(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ScrollOnExpand(
              child: ExpandablePanel(
                  header: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      rsu,
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.15,
                      style: const TextStyle(
                          backgroundColor: Color.fromARGB(41, 30, 255, 0)),
                    ),
                  ),
                  collapsed: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Available :",
                                style: const TextStyle(color: Colors.black)),
                            Text(
                              available,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Type :",
                                style: const TextStyle(color: Colors.black)),
                            Text(
                              type,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  expanded: SizedBox(
                    //width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height,
                    //height: 500,
                    child: _dataRetrieve(
                        rsu,
                        available,
                        type,
                        id,
                        changes,
                        make,
                        automanual,
                        capacity,
                        description,
                        replace,
                        reason,
                        lastdate,
                        nextdate),
                  )),
            ),
          ),
        ),
      );

  Widget _dataRetrieve(rsu, available, type, id, changes, make, automanual,
      capacity, description, replace, reason, lastdate, nextdate) {
    return ListView(
      shrinkWrap: true,

      //print(d.toString());

      children: [
        Card(
          color: Colors.greenAccent.shade100,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Make"),
                  Text(":"),
                  Text(make),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Capacity"),
                  Text(":"),
                  Text(capacity),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Auto/Manual"),
                  Text(":"),
                  Text(automanual),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Last Repaired Date   :  " +
              DateFormat('yyyy-MM-dd KK:mm:ss a').format(lastdate),
          style: const TextStyle(
              backgroundColor: Colors.white10,
              wordSpacing: 5,
              color: Color.fromARGB(255, 0, 118, 253)),
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Need to replace ?  :   " + replace,
          style: const TextStyle(color: Color.fromARGB(169, 0, 0, 0)),
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Reason   :  " + reason,
          style: const TextStyle(color: Color.fromARGB(169, 0, 0, 0)),
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Any Other Changes identified   :  " + changes,
          style: const TextStyle(color: Color.fromARGB(169, 0, 0, 0)),
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Description/Repairing Details  :   " + description,
          style: const TextStyle(
              // backgroundColor: Colors.white10,

              color: Color.fromARGB(255, 42, 85, 70)),
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Next Modify Date   :   " +
              DateFormat('yyyy-MM-dd KK:mm:ss a').format(nextdate),
          style: const TextStyle(
              backgroundColor: Colors.white10,
              wordSpacing: 5,
              color: Color.fromARGB(255, 0, 118, 253)),
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*IconButton(
              icon: const Icon(Icons.edit_note),
              // splashColor:
              // const Color.fromARGB(255, 8, 219, 54),
              highlightColor: const Color.fromARGB(171, 0, 255, 21),
              color: const Color.fromARGB(228, 219, 152, 26),
              onPressed: () {
                String generatorEditId = id;
                _showMyEditableDialog(generatorEditId, rsu);
              },
            ), */
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.history),
                  // splashColor:
                  // const Color.fromARGB(255, 8, 219, 54),
                  highlightColor: const Color.fromARGB(171, 0, 255, 21),
                  color: const Color.fromARGB(228, 219, 152, 26),
                  onPressed: () {
                    if (rsu == "Polonnaruwa") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Aralaganvilap()));
                    } else if (rsu == "Aralaganvila") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Aralaganvila()));
                    } else if (rsu == "Hingurakgoda") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Aralaganvilah()));
                    } else if (rsu == "Dehiattakandiya") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Aralaganvilad()));
                    } else if (rsu == "Welikanda") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Aralaganvilaw()));
                    } else if (rsu == "Medirigiriya") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Aralaganvilam()));
                    } else if (rsu == "Pulasthigama") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Aralaganvilapu()));
                    } else {
                      print("Please check the Spellings of the RSU");
                    }
                  },
                ),
                const Text("Repairing History"),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit_note),
                  // splashColor:
                  // const Color.fromARGB(255, 8, 219, 54),
                  highlightColor: const Color.fromARGB(171, 0, 255, 21),
                  color: const Color.fromARGB(228, 219, 152, 26),
                  onPressed: () {
                    String generatorEditId = id;
                    _showMyEditableDialog(generatorEditId, rsu);
                  },
                ),
                const Text("Edit last repairing"),
              ],
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  // splashColor:
                  // const Color.fromARGB(255, 8, 219, 54),
                  highlightColor: const Color.fromARGB(171, 0, 255, 21),
                  color: const Color.fromARGB(186, 10, 73, 2),
                  onPressed: () {
                    //alert eken database 1 haraha labaganna targetid eka laba deema.
                    String generatorId = id;
                    _showMyDialog(generatorId, rsu,
                        type); // alert ekata adala object/function name eka thama methana call krnne
                  },
                ),
                const Text("Repair"),
              ],
            ),
          ],
        ),
      ],
    );
  }

// alert ekak display wena object eka. meka _HomePageState class eka athule build object ekata pitin aluth object 1k wdyata thama add krnne
  // ignore: unused_element
  Future<void> _showMyDialog(generatorId, rsu, type) async {
    // targetId kiyala variable 1k danne alert ekedi add karana contribution data, tika koi target eke contribution eka widiyatada add wenna one kiyana eka set krnna.
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // user must tap button! / user button eka click karnaknma alert eka ain wenne ne. meka true karoth screen eke wena thanaka touch karath alert eka ain wenwa
      builder: (BuildContext context) {
        final hours1 = date1.hour.toString().padLeft(2, '0');
        final minutes1 = date1.minute.toString().padLeft(2, '0');
        final hours2 = date2.hour.toString().padLeft(2, '0');
        final minutes2 = date2.minute.toString().padLeft(2, '0');
        return AlertDialog(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rsu,
                style: const TextStyle(
                    //backgroundColor: Color.fromARGB(66, 156, 156, 156),
                    wordSpacing: 5,
                    color: Colors.green),
                textScaleFactor: 1.0,
              ),
              Text(
                type,
                style: const TextStyle(
                    //backgroundColor: Color.fromARGB(66, 156, 156, 156),
                    wordSpacing: 5,
                    color: Colors.green),
                textScaleFactor: 1.0,
              ),
            ],
          ), // "const" kiyanne eke agayan(values) wenas wenne nathi wenna ona.
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final date_la = await pickDate1();
                          if (date_la == null) return; // when pressed 'cancel'
                          final newDateTime = DateTime(
                            date_la.year,
                            date_la.month,
                            date_la.day,
                            date1.hour,
                            date1.minute,
                          );
                          setState(() => date1 = date_la); // when pressed 'ok'
                        },
                        child:
                            Text('${date1.year}/${date1.month}/${date1.day}')),
                    ElevatedButton(
                        onPressed: () async {
                          final time_la = await pickTime1();
                          if (time_la == null) return; // when pressed 'cancel'
                          final newDateTime = DateTime(
                            date1.year,
                            date1.month,
                            date1.day,
                            time_la.hour,
                            time_la.minute,
                          );
                          setState(
                              () => date1 = newDateTime); // when pressed 'ok'
                        },
                        child: Text('$hours1:$minutes1')),
                  ],
                ),
                /*  ElevatedButton(
                  onPressed: () async {
                    //async kiyanne nawathila inna plwn jathiye object 1k kiyana eka
                    date1 = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2500)))!;
                  },
                  child: const Text("Select a Date"),
                ), */
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Need to Replace ? :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtNeedReplace,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Reasons ? :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtReason,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Any Other Changes Identified ? :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtAnyOtherChangesIdentified,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Repairing Details/ Description :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtDescription,
                ),
                const Text(
                  'Next Repairing Date :',
                  textScaleFactor: 0.9,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final date_ne = await pickDate2();
                          if (date_ne == null) return; // when pressed 'cancel'
                          final newDateTime = DateTime(
                            date_ne.year,
                            date_ne.month,
                            date_ne.day,
                            date2.hour,
                            date2.minute,
                          );
                          setState(() => date2 = date_ne); // when pressed 'ok'
                        },
                        child:
                            Text('${date2.year}/${date2.month}/${date2.day}')),
                    ElevatedButton(
                        onPressed: () async {
                          final time_ne = await pickTime2();
                          if (time_ne == null) return; // when pressed 'cancel'
                          final newDateTime = DateTime(
                            date2.year,
                            date2.month,
                            date2.day,
                            time_ne.hour,
                            time_ne.minute,
                          );
                          setState(
                              () => date2 = newDateTime); // when pressed 'ok'
                        },
                        child: Text('$hours2:$minutes2')),
                  ],
                ),
                /*  ElevatedButton(
                  onPressed: () async {
                    //async kiyanne nawathila inna plwn jathiye object 1k kiyana eka
                    date2 = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2500)))!;
                  },
                  child: const Text("Select a Date"),
                ), */
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
                    String needToReplaced = txtNeedReplace.text;
                    String reason = txtReason.text;
                    String anyOtherChanges = txtAnyOtherChangesIdentified.text;

                    if (rsu == "Polonnaruwa") {
                      FirebaseFirestore.instance
                          .collection("repairpolonnaruwagenerator")
                          .doc() //"contributions"
                          .set({
                        'name_of_repairing_generator_rp': rsu,
                        'last_repaired_date_rp': date1,
                        'need_to_replace_rp': needToReplaced,
                        'reason_rp': reason,
                        'any_other_changes_identified_rp': anyOtherChanges,
                        'description_rp': description,
                        'next_repairing_date_rp': date2,
                        'generator_id_rp': generatorId,
                      });
                    } else if (rsu == "Aralaganvila") {
                      FirebaseFirestore.instance
                          .collection("repairaralaganvilagenerator")
                          .doc() //"contributions"
                          .set({
                        'name_of_repairing_generator_ra': rsu,
                        'last_repaired_date_ra': date1,
                        'need_to_replace_ra': needToReplaced,
                        'reason_ra': reason,
                        'any_other_changes_identified_ra': anyOtherChanges,
                        'description_ra': description,
                        'next_repairing_date_ra': date2,
                        'generator_id_ra': generatorId,
                      });
                    } else if (rsu == "Dehiattakandiya") {
                      FirebaseFirestore.instance
                          .collection("repairdehiattakandiyagenerator")
                          .doc() //"contributions"
                          .set({
                        'name_of_repairing_generator_rd': rsu,
                        'last_repaired_date_rd': date1,
                        'need_to_replace_rd': needToReplaced,
                        'reason_rd': reason,
                        'any_other_changes_identified_rd': anyOtherChanges,
                        'description_rd': description,
                        'next_repairing_date_rd': date2,
                        'generator_id_rd': generatorId,
                      });
                    } else if (rsu == "Hingurakgoda") {
                      FirebaseFirestore.instance
                          .collection("repairhingurakgodagenerator")
                          .doc() //"contributions"
                          .set({
                        'name_of_repairing_generator_rh': rsu,
                        'last_repaired_date_rh': date1,
                        'need_to_replace_rh': needToReplaced,
                        'reason_rh': reason,
                        'any_other_changes_identified_rh': anyOtherChanges,
                        'description_rh': description,
                        'next_repairing_date_rh': date2,
                        'generator_id_rh': generatorId,
                      });
                    } else if (rsu == "Medirigiriya") {
                      FirebaseFirestore.instance
                          .collection("repairmedirigiriyagenerator")
                          .doc() //"contributions"
                          .set({
                        'name_of_repairing_generator_rm': rsu,
                        'last_repaired_date_rm': date1,
                        'need_to_replace_rm': needToReplaced,
                        'reason_rm': reason,
                        'any_other_changes_identified_rm': anyOtherChanges,
                        'description_rm': description,
                        'next_repairing_date_rm': date2,
                        'generator_id_rm': generatorId,
                      });
                    } else if (rsu == "Pulasthigama") {
                      FirebaseFirestore.instance
                          .collection("repairpulasthigamagenerator")
                          .doc() //"contributions"
                          .set({
                        'name_of_repairing_generator_rpu': rsu,
                        'last_repaired_date_rpu': date1,
                        'need_to_replace_rpu': needToReplaced,
                        'reason_rpu': reason,
                        'any_other_changes_identified_rpu': anyOtherChanges,
                        'description_rpu': description,
                        'next_repairing_date_rpu': date2,
                        'generator_id_rpu': generatorId,
                      });
                    } else if (rsu == "Welikanda") {
                      FirebaseFirestore.instance
                          .collection("repairwelikandagenerator")
                          .doc() //"contributions"
                          .set({
                        'name_of_repairing_generator_rw': rsu,
                        'last_repaired_date_rw': date1,
                        'need_to_replace_rw': needToReplaced,
                        'reason_rw': reason,
                        'any_other_changes_identified_rw': anyOtherChanges,
                        'description_rw': description,
                        'next_repairing_date_rw': date2,
                        'generator_id_rw': generatorId,
                      });
                    } else {
                      print("Please check the Spellings of the RSu");
                    }

                    FirebaseFirestore.instance
                        .collection("repairgenerator") //"contributions"
                        .add({
                      'name_of_repairing_generator_r': rsu,
                      'last_repaired_date_r': date1,
                      'need_to_replace_r': needToReplaced,
                      'reason_r': reason,
                      'any_other_changes_identified_r': anyOtherChanges,
                      'description_r': description,
                      'next_repairing_date_r': date2,
                      'generator_id_r': generatorId,
                    });

                    //database eke data update karana code kotasak
                    // mehidi "targets" table eke "contribution_tota" kiyana document eka thama update krnne.
                    FirebaseFirestore.instance
                        .collection('addgenerator')
                        .doc(generatorId)
                        .update({
                      'last_repaired_date_a': date1,
                      'description_a': description,
                      'next_repairing_date_a': date2,
                      'need_to_replace_a': needToReplaced,
                      'reason_a': reason,
                      'any_other_changes_identified_a': anyOtherChanges,

                      //mehidi tiyana contribution total value ekatama aluth contribution eka ekathu wela update wenna ona nisai "FieldValue.increment()" use krnne.
                      // delete krnna onenm "FieldValue.delete()" wage wenas kra kra update kirim krnna plwn
                    });

                    //date1 = null;
                    txtDescription.clear();
                    txtNeedReplace.clear();
                    txtReason.clear();
                    txtAnyOtherChangesIdentified.clear();

                    // txtAmount.clear(); use krnnath plwn
                    // date2 = null;
                    //txtNote.clear(); use krnnath plwn
                    Navigator.of(context)
                        .pop(); // popup eka remove krnwa display eken
                  },
                ),
                TextButton(
                  onPressed: () {
                    // date1 = null;
                    txtDescription.clear();
                    txtNeedReplace.clear();
                    txtReason.clear();
                    txtAnyOtherChangesIdentified.clear();
                    //date2 = null;
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

  Future<DateTime?> pickDate1() => showDatePicker(
      context: context,
      initialDate: date1,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime1() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: date1.hour, minute: date1.minute));

  Future<DateTime?> pickDate2() => showDatePicker(
      context: context,
      initialDate: date2,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime2() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: date2.hour, minute: date2.minute));

  //...........................................................................................................
  Future<void> _showMyEditableDialog(generatorEditId, rsu) async {
    // targetId kiyala variable 1k danne alert ekedi add karana contribution data, tika koi target eke contribution eka widiyatada add wenna one kiyana eka set krnna.
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // user must tap button! / user button eka click karnaknma alert eka ain wenne ne. meka true karoth screen eke wena thanaka touch karath alert eka ain wenwa
      builder: (BuildContext context) {
        final hours3 = date3.hour.toString().padLeft(2, '0');
        final minutes3 = date3.minute.toString().padLeft(2, '0');
        final hours4 = date4.hour.toString().padLeft(2, '0');
        final minutes4 = date4.minute.toString().padLeft(2, '0');
        return AlertDialog(
          title: const Text(
            'Update Repairing Details',
            style: TextStyle(color: Colors.amber),
          ), // "const" kiyanne eke agayan(values) wenas wenne nathi wenna ona.
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text(
                  'Last Repaired Date',
                  textScaleFactor: 0.9,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final date_la_up = await pickDate3();
                          if (date_la_up == null)
                            return; // when pressed 'cancel'
                          final newDateTime = DateTime(
                            date_la_up.year,
                            date_la_up.month,
                            date_la_up.day,
                            date3.hour,
                            date3.minute,
                          );
                          setState(
                              () => date3 = date_la_up); // when pressed 'ok'
                        },
                        child:
                            Text('${date3.year}/${date3.month}/${date3.day}')),
                    ElevatedButton(
                        onPressed: () async {
                          final time_la_up = await pickTime3();
                          if (time_la_up == null)
                            return; // when pressed 'cancel'
                          final newDateTime = DateTime(
                            date3.year,
                            date3.month,
                            date3.day,
                            time_la_up.hour,
                            time_la_up.minute,
                          );
                          setState(
                              () => date3 = newDateTime); // when pressed 'ok'
                        },
                        child: Text('$hours3:$minutes3')),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Need To Replace ? : ',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtNeedReplaceEdit,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Reasons to Replace : ',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtReasonEdit,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Any Other Changes Identified : ',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtAnyOtherChangesIdentifiedEdit,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Repairing Details/Description : ',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtDescriptionedit,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Next Repairing Date',
                  textScaleFactor: 0.9,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final date_ne_up = await pickDate4();
                          if (date_ne_up == null)
                            return; // when pressed 'cancel'
                          final newDateTime = DateTime(
                            date_ne_up.year,
                            date_ne_up.month,
                            date_ne_up.day,
                            date4.hour,
                            date4.minute,
                          );
                          setState(
                              () => date4 = date_ne_up); // when pressed 'ok'
                        },
                        child:
                            Text('${date4.year}/${date4.month}/${date4.day}')),
                    ElevatedButton(
                        onPressed: () async {
                          final time_ne_up = await pickTime4();
                          if (time_ne_up == null)
                            return; // when pressed 'cancel'
                          final newDateTime = DateTime(
                            date4.year,
                            date4.month,
                            date4.day,
                            time_ne_up.hour,
                            time_ne_up.minute,
                          );
                          setState(
                              () => date4 = newDateTime); // when pressed 'ok'
                        },
                        child: Text('$hours4:$minutes4')),
                  ],
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

                    String needToReplaced = txtNeedReplaceEdit.text;
                    String reason = txtReasonEdit.text;
                    String anyOtherChanges =
                        txtAnyOtherChangesIdentifiedEdit.text;
                    String description = txtDescriptionedit.text;

                    /* FirebaseFirestore.instance
                        .collection('repairgenerator')
                        .doc('bZq1uxBXND60fO3aaOyU')
                        .update({
                      'last_repaired_date_r': date3,
                      'need_to_replace_r': needToReplaced,
                      'reason_r': reason,
                      'any_other_changes_identified_r': anyOtherChanges,
                      'description_r': description,
                      'next_repairing_date_r': date4,  

                      //mehidi tiyana contribution total value ekatama aluth contribution eka ekathu wela update wenna ona nisai "FieldValue.increment()" use krnne.
                      // delete krnna onenm "FieldValue.delete()" wage wenas kra kra update kirim krnna plwn
                    });  */
                    FirebaseFirestore.instance
                        .collection('addgenerator')
                        .doc(generatorEditId)
                        .update({
                      'last_repaired_date_a': date3,
                      'description_a': description,
                      'next_repairing_date_a': date4,
                      'need_to_replace_a': needToReplaced,
                      'reason_a': reason,
                      'any_other_changes_identified_a': anyOtherChanges,

                      //mehidi tiyana contribution total value ekatama aluth contribution eka ekathu wela update wenna ona nisai "FieldValue.increment()" use krnne.
                      // delete krnna onenm "FieldValue.delete()" wage wenas kra kra update kirim krnna plwn
                    });
                    //date3 = null;
                    txtAnyOtherChangesIdentifiedEdit.clear();
                    txtDescriptionedit.clear();
                    txtNeedReplaceEdit.clear();
                    txtReasonEdit.clear();

                    //date4 = null;
                    //txtNote.clear(); use krnnath plwn
                    Navigator.of(context)
                        .pop(); // popup eka remove krnwa display eken
                  },
                ),
                TextButton(
                  onPressed: () {
                    //date3 = null;
                    txtAnyOtherChangesIdentifiedEdit.clear();
                    txtDescriptionedit.clear();
                    txtNeedReplaceEdit.clear();
                    txtReasonEdit.clear();
                    //date4 = null;
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

  Future<DateTime?> pickDate3() => showDatePicker(
      context: context,
      initialDate: date3,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime3() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: date3.hour, minute: date3.minute));

  Future<DateTime?> pickDate4() => showDatePicker(
      context: context,
      initialDate: date4,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime4() => showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: date4.hour, minute: date4.minute));
}
