import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddGenerator extends StatefulWidget {
  const AddGenerator({Key? key}) : super(key: key);

  @override
  _AddGeneratorState createState() => _AddGeneratorState();
}

class _AddGeneratorState extends State<AddGenerator> {
//text field wala enter karana data labaganimata adalawa controller mention kirima
  TextEditingController txtRSU = TextEditingController();
  TextEditingController txtType = TextEditingController();
  TextEditingController txtCapacity = TextEditingController();
  TextEditingController txtAutoOrManual = TextEditingController();
  TextEditingController txtMake = TextEditingController();
  TextEditingController txtAvailability = TextEditingController();
//select karana or type karana date eka labaganimata adalawa controller mention kirima

  // "?" and "late" eken krnne date kiyana eka null wennath plwn nowennath plwn kiyala kiyana eka
  // e kiynne apita date eka select krnne natiwath submit kirimak wenna plwn kiyana eka
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                shadowColor: Colors.black,
                // card kiyanne e adala text eka(or etc..)wenama sudu pata kotuwakin wen krla penwana ekak
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, // sudu kotuwa sampurnama lokuwata watenwa
                    children: [
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text(
                        "ADD NEW GENERATOR",
                        style: TextStyle(color: Colors.amber),
                        textScaleFactor: 1.3, //text eke size eka wenas kirima
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 25.0,
                      ),
                      const Text("RSU"),
                      TextFormField(
                        controller: txtRSU,
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text("Type"),
                      TextFormField(
                        controller: txtType,
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text("Avalability"),
                      TextFormField(
                        controller: txtAvailability,
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text("Capacity"),
                      TextFormField(
                        controller: txtCapacity,
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text("Auto/manual"),
                      TextFormField(
                        controller: txtAutoOrManual,
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text("Make"),
                      TextFormField(
                        controller: txtMake,
                      ),

                      //text field eke and date field eke type karana data weradunoth clear kirimata
                      ButtonBar(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                txtRSU.clear();
                                txtAvailability.clear();
                                txtAutoOrManual.clear();
                                txtCapacity.clear();
                                txtMake.clear();
                                txtType.clear();
                                //date = null;
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              )),
                          //save karama database ekata data yana widiya
                          ElevatedButton(
                              onPressed: () {
                                String rsu = txtRSU.text;
                                String availability = txtAvailability.text;
                                String autoOrManual = txtAutoOrManual.text;
                                String capacity = txtCapacity.text;
                                String make = txtMake.text;
                                String type = txtType.text;

                                FirebaseFirestore.instance
                                    .collection("addgenerator")
                                    .add({
                                  'rsu': rsu,
                                  'availability_a': availability,
                                  'auto_or_manual_a': autoOrManual,
                                  'capacity_a': capacity,
                                  'make_a': make,
                                  'type_a': type,
                                  'last_repaired_date_a': Timestamp.now(),
                                  'description_a': "",
                                  'next_repairing_date_a': Timestamp.now(),
                                  'need_to_replace_a': "",
                                  'reason_a': "",
                                  'any_other_changes_identified_a': "",
                                  /*"amount": int.parse(
                                        amount), */ //integer type eken database 1ta amount 1 ya yuthu nsa
                                });

                                txtRSU.clear();
                                txtAvailability.clear();
                                txtAutoOrManual.clear();
                                txtCapacity.clear();
                                txtMake.clear();
                                txtType.clear();
                                //date = null;
                                Navigator.of(context).pop();
                              },
                              child: const Text("Save",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
