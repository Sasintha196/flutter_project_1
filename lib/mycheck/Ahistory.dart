import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_slt/tabs/HomePage.dart';
import 'package:intl/intl.dart';

class Ahistory extends StatefulWidget {
  const Ahistory({Key? key}) : super(key: key);

  @override
  State<Ahistory> createState() => _AhistoryState();
}

class _AhistoryState extends State<Ahistory> {
  final Stream<QuerySnapshot> _polonnaruwaStream = FirebaseFirestore.instance
      .collection('repaiac')
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
                            "All Ac Machines",
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
                        String name = document['room_or_area_name_r'];

                        String cooling =
                            document['cooling_sufficient_r'].toString();

                        String indoor =
                            document['indoor_plant_condition_r'].toString();
                        String outdoor =
                            document['outdoor_plant_condition_r'].toString();
                        String remark =
                            document['remark_or_comment_r'].toString();

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
                                            name,
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
