import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_slt/target/AddGenerator.dart';
import 'package:intl/intl.dart';

class Aralaganvilad extends StatefulWidget {
  const Aralaganvilad({Key? key}) : super(key: key);

  @override
  _AralaganviladState createState() => _AralaganviladState();
}

class _AralaganviladState extends State<Aralaganvilad> {
// alert eke data display wimata adalawa textFormField 2ke controler mention kirima
  //TextEditingController txtAmount = TextEditingController();

// database eka ha sambandawimata adalawa mention krnne
  final Stream<QuerySnapshot> _polonnaruwaStream = FirebaseFirestore.instance
      .collection('repairdehiattakandiyagenerator')
      .orderBy('last_repaired_date_rd', descending: true)
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
                        String rsu = document['name_of_repairing_generator_rd'];

                        String changes =
                            document['any_other_changes_identified_rd']
                                .toString();

                        String description =
                            document['description_rd'].toString();
                        String replace =
                            document['need_to_replace_rd'].toString();
                        String reason = document['reason_rd'].toString();

                        Timestamp last = document[
                            'last_repaired_date_rd']; // Timestamp(seconds=1624653319,nanoseconds=326000000)
                        DateTime lastdate = last.toDate();

                        return Column(
                          children: [
                            Container(
                              color: Colors.white70,
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
