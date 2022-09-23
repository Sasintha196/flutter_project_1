import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_slt/tabs/HomePage.dart';
import 'package:intl/intl.dart';

class Ghistory extends StatefulWidget {
  const Ghistory({Key? key}) : super(key: key);

  @override
  State<Ghistory> createState() => _GhistoryState();
}

class _GhistoryState extends State<Ghistory> {
  final Stream<QuerySnapshot> _polonnaruwaStream = FirebaseFirestore.instance
      .collection('repairgenerator')
      .orderBy('last_repaired_date_r', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: Colors.black,
      color: Colors.white70,
      child: StreamBuilder<QuerySnapshot>(
          stream: _polonnaruwaStream,
          builder:
              (BuildContext contet, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went Wrong!");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            " Repairing History",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "of",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "All Generators",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListView(
                      shrinkWrap: true,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        String id = document.id;
                        String rsu = document['name_of_repairing_generator_r'];

                        String changes =
                            document['any_other_changes_identified_r']
                                .toString();

                        String description =
                            document['description_r'].toString();
                        String replace =
                            document['need_to_replace_r'].toString();
                        String reason = document['reason_r'].toString();

                        Timestamp last = document[
                            'last_repaired_date_r']; // Timestamp(seconds=1624653319,nanoseconds=326000000)
                        DateTime lastdate = last.toDate();

                        return Column(
                          children: [
                            Container(
                              color: Colors.white70,
                              child: ExpandableNotifier(
                                  child: ScrollOnExpand(
                                      child: ExpandablePanel(
                                          header: Text(
                                            rsu,
                                            // textAlign: TextAlign.center,
                                            textScaleFactor: 1.15,
                                            style: const TextStyle(
                                                backgroundColor: Color.fromARGB(
                                                    41, 30, 255, 0)),
                                          ),
                                          collapsed: Text(
                                            "Last Repaired : " +
                                                DateFormat(
                                                        'yyyy-MM-dd KK:mm:ss a')
                                                    .format(lastdate),
                                            style: const TextStyle(
                                                backgroundColor: Colors.white10,
                                                wordSpacing: 5,
                                                color: Color.fromARGB(
                                                    255, 0, 118, 253)),
                                            textScaleFactor: 1,
                                          ),
                                          expanded: ListView(
                                            shrinkWrap: true,
                                            children: [
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Need to replace ?  :   " +
                                                    replace,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        169, 0, 0, 0)),
                                                textScaleFactor: 1,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Reason   :  " + reason,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        169, 0, 0, 0)),
                                                textScaleFactor: 1,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Any Other Changes identified   :  " +
                                                    changes,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        169, 0, 0, 0)),
                                                textScaleFactor: 1,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Description/Repairing Details  :   " +
                                                    description,
                                                style: const TextStyle(
                                                    // backgroundColor: Colors.white10,

                                                    color: Color.fromARGB(
                                                        255, 42, 85, 70)),
                                                textScaleFactor: 1,
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          )))),
                            ),
                            SizedBox(
                              height: 4,
                            )
                          ],
                        );
                      }).toList()),
                ],
              ),
            );
          }),
    );
  }
}


/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AllGeneratorsHistory extends StatefulWidget {
  const AllGeneratorsHistory({Key? key}) : super(key: key);

  @override
  _AllGeneratorsHistoryState createState() => _AllGeneratorsHistoryState();
}

class _AllGeneratorsHistoryState extends State<AllGeneratorsHistory> {
// alert eke data display wimata adalawa textFormField 2ke controler mention kirima
  //TextEditingController txtAmount = TextEditingController();

// database eka ha sambandawimata adalawa mention krnne
  final Stream<QuerySnapshot> _polonnaruwaStream = FirebaseFirestore.instance
      .collection('repairgenerator')
      .orderBy('last_repaired_date_r')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: Card(
        elevation: 20,
        shadowColor: Colors.black,
        color: Color.fromARGB(143, 248, 236, 198),
        child: StreamBuilder<QuerySnapshot>(
            stream: _polonnaruwaStream,
            builder:
                (BuildContext contet, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    String id = document.id;
                    String rsu = document['name_of_repairing_generator_r'];
                    //String available = document['availability_a'].toString();
                    //String make = document['make_a'].toString();
                    String changes =
                        document['any_other_changes_identified_r'].toString();
                    //String automanual = document['auto_or_manual_a'].toString();
                    //String capacity = document['capacity_a'].toString();
                    String description = document['description_r'].toString();
                    String replace = document['need_to_replace_r'].toString();
                    String reason = document['reason_r'].toString();

                    //String type = document['type_a'].toString();
                    Timestamp last = document[
                        'last_repaired_date_r']; // Timestamp(seconds=1624653319,nanoseconds=326000000)
                    DateTime lastdate = last.toDate();
                    Timestamp next = document['next_repairing_date_r'];
                    DateTime nextdate = next.toDate();
                    return Container(
                      child: Column(
                        children: [
                          buildCard(rsu, id, changes, description, replace,
                              reason, lastdate, nextdate),
                          const SizedBox(
                            height: 0.5,
                          ),
                        ],
                      ),
                    );
                  }).toList());
            }),
      ),
    );
  }

  Widget buildCard(
          rsu, id, changes, description, replace, reason, lastdate, nextdate) =>
      SingleChildScrollView(
        child: ExpandableNotifier(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Card(
              clipBehavior: Clip.antiAlias,
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
                          child: Text(
                            "Last Repaired : " +
                                DateFormat('yyyy-MM-dd KK:mm:ss a')
                                    .format(lastdate),
                            style: const TextStyle(
                                backgroundColor: Colors.white10,
                                wordSpacing: 5,
                                color: Color.fromARGB(255, 0, 118, 253)),
                            textScaleFactor: 1,
                          ),
                        ),
                      ],
                    ),
                    expanded: Container(
                      padding: const EdgeInsets.all(8),
                      child: _dataRetrieve(rsu, id, changes, description,
                          replace, reason, nextdate),
                    )),
              ),
            ),
          ),
        ),
      );

  Widget _dataRetrieve(
      rsu, id, changes, description, replace, reason, nextdate) {
    return Card(
      color: const Color.fromARGB(199, 253, 251, 251),
      // height: 300,
      // width: 300,
      //height: MediaQuery.of(context).size.height, // container eke usa
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Need to replace ?  :   " + replace,
            style: const TextStyle(color: Color.fromARGB(169, 0, 0, 0)),
            textScaleFactor: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Reason   :  " + reason,
            style: const TextStyle(color: Color.fromARGB(169, 0, 0, 0)),
            textScaleFactor: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Any Other Changes identified   :  " + changes,
            style: const TextStyle(color: Color.fromARGB(169, 0, 0, 0)),
            textScaleFactor: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Description/Repairing Details  :   " + description,
            style: const TextStyle(
                // backgroundColor: Colors.white10,

                color: Color.fromARGB(255, 42, 85, 70)),
            textScaleFactor: 1,
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}









*/