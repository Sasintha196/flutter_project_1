import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAc extends StatefulWidget {
  const AddAc({Key? key}) : super(key: key);

  @override
  _AddAcState createState() => _AddAcState();
}

class _AddAcState extends State<AddAc> {
//text field wala enter karana data labaganimata adalawa controller mention kirima
  TextEditingController txtacnumber = TextEditingController();
  TextEditingController txtroomorareaname = TextEditingController();
  TextEditingController txtmodalno = TextEditingController();
  TextEditingController txindoorplantsnumber = TextEditingController();
  TextEditingController txtoutdoorplantsnumber = TextEditingController();

  TextEditingController txtbrand = TextEditingController();

  TextEditingController txtcategory = TextEditingController();

//select karana or type karana date eka labaganimata adalawa controller mention kirima
  DateTime? date;

  // "?" and "late" eken krnne date kiyana eka null wennath plwn nowennath plwn kiyala kiyana eka
  // e kiynne apita date eka select krnne natiwath submit kirimak wenna plwn kiyana eka
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      // padding: const EdgeInsets.all(10),
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
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, // sudu kotuwa sampurnama lokuwata watenwa
                    children: [
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text(
                        "ADD NEW AC", style: TextStyle(color: Colors.amber),
                        textScaleFactor: 1.3, //text eke size eka wenas kirima
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 25.0,
                      ),
                      const Text("Ac Number"),
                      TextFormField(
                        controller: txtacnumber,
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text("Ac Room/Area Name"),
                      TextFormField(
                        controller: txtroomorareaname,
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text("Brand"),
                      TextFormField(
                        controller: txtbrand,
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text("Category"),
                      TextFormField(
                        controller: txtcategory,
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text("Model Number"),
                      TextFormField(
                        controller: txtmodalno,
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text("Indoor Plant S/N"),
                      TextFormField(
                        controller: txindoorplantsnumber,
                      ),
                      const SizedBox(
                        //box ekak wage wena widiyata ida wenkara sadeema
                        height: 15.0,
                      ),
                      const Text("Outdoor Plant S/N"),
                      TextFormField(
                        controller: txtoutdoorplantsnumber,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      //text field eke and date field eke type karana data weradunoth clear kirimata
                      ButtonBar(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                txtroomorareaname.clear();
                                txtmodalno.clear();
                                txindoorplantsnumber.clear();
                                txtoutdoorplantsnumber.clear();
                                txtbrand.clear();
                                txtcategory.clear();
                                date = null;
                                Navigator.of(context).pop();
                              },
                              child: const Text("Cancel")),
                          //save karama database ekata data yana widiya
                          ElevatedButton(
                              onPressed: () {
                                String roomorareaname = txtroomorareaname.text;
                                String modelnumber = txtmodalno.text;
                                String indoorplantsnumber =
                                    txindoorplantsnumber.text;
                                String outdoorplantsnumbernumber =
                                    txtoutdoorplantsnumber.text;
                                String brand = txtbrand.text;
                                String category = txtcategory.text;
                                String acnumber = txtacnumber.text;

                                FirebaseFirestore.instance
                                    .collection("addac")
                                    .add({
                                  "ac_number": acnumber,
                                  "room_or_area_name_a": roomorareaname,
                                  "model_no_a": modelnumber,
                                  /*"amount": int.parse(
                                        amount), */ //integer type eken database 1ta amount 1 ya yuthu nsa
                                  "indoor_plant_snumber_a": indoorplantsnumber,
                                  "outdoor_plant_snumber_a":
                                      outdoorplantsnumbernumber,
                                  "category_a": category,
                                  "brand": brand,
                                  "cooling_sufficient_a": "",
                                  "condition_of_indoor_plant_a": "",
                                  "condition_of_outdoor_plant_a": "",
                                  "remark_or_comment_a": "",
                                  "last_repaired_date_a": Timestamp.now(),
                                  "next_repairing_date_a": Timestamp.now(),

                                  // "complete": 0,
                                  // "contribution_total": 0
                                });
                                txtroomorareaname.clear();
                                txtmodalno.clear();
                                txindoorplantsnumber.clear();
                                txtoutdoorplantsnumber.clear();
                                txtbrand.clear();
                                txtcategory.clear();
                                txtacnumber.clear();

                                Navigator.of(context).pop();
                              },
                              child: const Text("Save"))
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
