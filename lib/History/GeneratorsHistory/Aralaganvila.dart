import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_slt/target/AddGenerator.dart';
import 'package:intl/intl.dart';

class Aralaganvila extends StatefulWidget {
  const Aralaganvila({Key? key}) : super(key: key);

  @override
  _AralaganvilaState createState() => _AralaganvilaState();
}

class _AralaganvilaState extends State<Aralaganvila> {
// alert eke data display wimata adalawa textFormField 2ke controler mention kirima
  //TextEditingController txtAmount = TextEditingController();

// database eka ha sambandawimata adalawa mention krnne
  final Stream<QuerySnapshot> _polonnaruwaStream = FirebaseFirestore.instance
      .collection('repairaralaganvilagenerator')
      .orderBy('last_repaired_date_ra', descending: true)
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
                        String rsu = document['name_of_repairing_generator_ra'];

                        String changes =
                            document['any_other_changes_identified_ra']
                                .toString();

                        String description =
                            document['description_ra'].toString();
                        String replace =
                            document['need_to_replace_ra'].toString();
                        String reason = document['reason_ra'].toString();

                        Timestamp last = document[
                            'last_repaired_date_ra']; // Timestamp(seconds=1624653319,nanoseconds=326000000)
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









/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Polonnaruwa extends StatefulWidget {
  const Polonnaruwa({Key? key}) : super(key: key);

  @override
  _PolonnaruwaState createState() => _PolonnaruwaState();
}

class _PolonnaruwaState extends State<Polonnaruwa> {
  Stream<QuerySnapshot> _polonnaruwaStream = FirebaseFirestore.instance
      .collection('repairpolonnaruwagenerator')
      .orderBy('last_repaired_date_rp')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _polonnaruwaStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("something is wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          itemBuilder: (_, index) {
            QueryDocumentSnapshot qs = snapshot.data!.docs[index];

            return Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Colors.grey.shade200,
                            style: BorderStyle.solid,
                            width: 2.0),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      title: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                               qs['name_of_repairing_generator_rp']
                              ),
                             
                              Text(
                                qs['last_repaired_date_rp'].toString(),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 223, 12, 12)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              qs['message'],
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey.shade100),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

*/
