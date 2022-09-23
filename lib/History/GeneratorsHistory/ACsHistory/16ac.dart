import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_slt/tabs/Ac.dart';

import 'package:intl/intl.dart';

class Ac16 extends StatefulWidget {
  const Ac16({Key? key}) : super(key: key);

  @override
  _Ac16State createState() => _Ac16State();
}

class _Ac16State extends State<Ac16> {
// alert eke data display wimata adalawa textFormField 2ke controler mention kirima
  //TextEditingController txtAmount = TextEditingController();

// database eka ha sambandawimata adalawa mention krnne
  final Stream<QuerySnapshot> _polonnaruwaStream = FirebaseFirestore.instance
      .collection('repairac16')
      .orderBy('last_repaired_date', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey.shade50,
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
                    height: 80,
                    child: Text(
                      "HISTORY",
                      style: TextStyle(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w900,
                          fontSize: 15),
                    ),
                  ),
                  ListView(
                      shrinkWrap: true,
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        String id = document.id;
                        String name = document['room_or_area_name'];

                        String cooling =
                            document['cooling_sufficient'].toString();

                        String indoor =
                            document['indoor_plant_condition'].toString();
                        String outdoor =
                            document['outdoor_plant_condition'].toString();
                        String remark =
                            document['remark_or_comment'].toString();

                        Timestamp last = document[
                            'last_repaired_date']; // Timestamp(seconds=1624653319,nanoseconds=326000000)
                        DateTime lastdate = last.toDate();

                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade50,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                              ),
                              //color: Colors.grey.shade50,
                              child: ExpandableNotifier(
                                  child: ScrollOnExpand(
                                      child: ExpandablePanel(
                                          header: Text(
                                            "show details",
                                            // textAlign: TextAlign.center,
                                            textScaleFactor: 0.9,
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
                                                "Cooling Sufficient   :   " +
                                                    cooling,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        169, 0, 0, 0)),
                                                textScaleFactor: 1,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Indoor Plant Condition   :  " +
                                                    indoor,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        169, 0, 0, 0)),
                                                textScaleFactor: 1,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Outdoor Plant Condition   :  " +
                                                    outdoor,
                                                style: const TextStyle(
                                                    color: Color.fromARGB(
                                                        169, 0, 0, 0)),
                                                textScaleFactor: 1,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                "Remark or Comment   :   " +
                                                    remark,
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
                              height: 2,
                            )
                          ],
                        );
                      }).toList()),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      //height: MediaQuery.of(context).size.height,
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
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Ac(),
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
                            "Back",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
