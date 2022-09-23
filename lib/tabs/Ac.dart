import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/10ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/11ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/12ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/13ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/14ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/15ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/16ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/17ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/18ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/19ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/1ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/20ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/21ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/22ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/23ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/24ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/25ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/26ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/27ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/28ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/29ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/2ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/30ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/31ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/32ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/33ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/34ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/35ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/36ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/37ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/38ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/39ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/3ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/40ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/41ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/42ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/43ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/44ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/4ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/5ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/6ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/7ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/8ac.dart';
import 'package:flutter_application_slt/History/GeneratorsHistory/ACsHistory/9ac.dart';

import 'package:flutter_application_slt/mycheck/Ahistory.dart';

import 'package:flutter_application_slt/target/AddAc.dart';
import 'package:intl/intl.dart';

class Ac extends StatefulWidget {
  const Ac({Key? key}) : super(key: key);

  @override
  _AcState createState() => _AcState();
}

class _AcState extends State<Ac> {
// alert eke data display wimata adalawa textFormField 2ke controler mention kirima
  //TextEditingController txtAmount = TextEditingController();
  TextEditingController txtCoolingSufficient = TextEditingController();
  TextEditingController txtIndoorplantcondition = TextEditingController();
  TextEditingController txtOutdoorplantcondition = TextEditingController();
  TextEditingController txtRemarkorComment = TextEditingController();
  TextEditingController txtCoolingSufficientEdit = TextEditingController();
  TextEditingController txtIndoorplantconditionEdit = TextEditingController();
  TextEditingController txtOutdoorplantconditionEdit = TextEditingController();
  TextEditingController txtRemarkorCommentEdit = TextEditingController();
  TextEditingController txtacnumber = TextEditingController();

  String rsu = "";

  DateTime date1 = DateTime.now();
  DateTime date2 = DateTime.now();
  DateTime date3 = DateTime.now();
  DateTime date4 = DateTime.now();

// database eka ha sambandawimata adalawa mention krnne
  final Stream<QuerySnapshot> _addacStream = FirebaseFirestore.instance
      .collection("addac")
      .orderBy('ac_number', descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search), hintText: 'Search...'),
          onChanged: (val) {
            setState(() {
              rsu = val;
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const AddAc()));
        }, //press karama wenna ona de {} athule liyanna
        child: const Icon(
            Icons.add), // floating action button eka athule tyna icon eka
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _addacStream,
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
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  String id = document.id;
                  String ac_no = document['ac_number'];
                  String room_or_area_name = document['room_or_area_name_a'];
                  String model_no = document['model_no_a'].toString();
                  String indoor_plant_snumber =
                      document['indoor_plant_snumber_a'].toString();
                  String outdoor_plant_snumber =
                      document['outdoor_plant_snumber_a'].toString();
                  String _brand = document['brand'].toString();
                  String _category = document['category_a'].toString();
                  String cooling_sufficient =
                      document['cooling_sufficient_a'].toString();
                  String condition_of_indoor_plant =
                      document['condition_of_indoor_plant_a'].toString();
                  String condition_of_outdoor_plant =
                      document['condition_of_outdoor_plant_a'].toString();

                  String remark_or_comment =
                      document['remark_or_comment_a'].toString();
                  Timestamp _last = document[
                      'last_repaired_date_a']; // Timestamp(seconds=1624653319,nanoseconds=326000000)
                  DateTime last = _last.toDate();
                  Timestamp _next = document['next_repairing_date_a'];
                  DateTime next = _next.toDate();
                  return Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: buildCard(
                            ac_no,
                            room_or_area_name,
                            model_no,
                            indoor_plant_snumber,
                            id,
                            outdoor_plant_snumber,
                            _brand,
                            _category,
                            cooling_sufficient,
                            condition_of_indoor_plant,
                            condition_of_outdoor_plant,
                            remark_or_comment,
                            last,
                            next),
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

  Widget buildCard(
          ac_no,
          room_or_area_name,
          model_no,
          indoor_plant_snumber,
          id,
          outdoor_plant_snumber,
          _brand,
          _category,
          cooling_sufficient,
          condition_of_indoor_plant,
          condition_of_outdoor_plant,
          remark_or_comment,
          last,
          next) =>
      SingleChildScrollView(
        child: ExpandableNotifier(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ScrollOnExpand(
              child: ExpandablePanel(
                  header: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          ac_no,
                          textAlign: TextAlign.start,
                          textScaleFactor: 0.5,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          room_or_area_name,
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.15,
                          style: const TextStyle(
                              backgroundColor: Color.fromARGB(41, 30, 255, 0)),
                        ),
                        Text(
                          _brand,
                          textAlign: TextAlign.center,
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ),
                  collapsed: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text(
                              "Model No: ",
                              style: TextStyle(color: Colors.black87),
                            ),
                            Text(
                              model_no,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Indoor plant S/N : ",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                Text(
                                  indoor_plant_snumber,
                                  style: const TextStyle(color: Colors.black26),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Outdoor plant S/N : ",
                                  style: TextStyle(color: Colors.black87),
                                ),
                                Text(
                                  outdoor_plant_snumber,
                                  style: const TextStyle(color: Colors.black26),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  expanded: SizedBox(
                    child: _dataRetrieve(
                        ac_no,
                        room_or_area_name,
                        model_no,
                        indoor_plant_snumber,
                        id,
                        outdoor_plant_snumber,
                        _brand,
                        _category,
                        cooling_sufficient,
                        condition_of_indoor_plant,
                        condition_of_outdoor_plant,
                        remark_or_comment,
                        last,
                        next),
                  )),
            ),
          ),
        ),
      );

  Widget _dataRetrieve(
      ac_no,
      room_or_area_name,
      model_no,
      indoor_plant_snumber,
      id,
      outdoor_plant_snumber,
      _brand,
      _category,
      cooling_sufficient,
      condition_of_indoor_plant,
      condition_of_outdoor_plant,
      remark_or_comment,
      last,
      next) {
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
                  Text("Model No"),
                  Text(":"),
                  Text(model_no),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Brand Name"),
                  Text(":"),
                  Text(_brand),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Category"),
                  Text(":"),
                  Text(_category),
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
              DateFormat('yyyy-MM-dd KK:mm:ss a').format(last),
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
          "Cooling Sufficient  :   " + cooling_sufficient,
          style: const TextStyle(color: Color.fromARGB(169, 0, 0, 0)),
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Condition of indoor plant   :  " + condition_of_indoor_plant,
          style: const TextStyle(color: Color.fromARGB(169, 0, 0, 0)),
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Condition of outdoor plant   :  " + condition_of_outdoor_plant,
          style: const TextStyle(color: Color.fromARGB(169, 0, 0, 0)),
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Remark / Comments  :   " + remark_or_comment,
          style: const TextStyle(
              // backgroundColor: Colors.white10,

              color: Color.fromARGB(255, 42, 85, 70)),
          textScaleFactor: 1,
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Next repairing Date   :   " +
              DateFormat('yyyy-MM-dd KK:mm:ss a').format(next),
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
            IconButton(
              icon: const Icon(Icons.history),
              // splashColor:
              // const Color.fromARGB(255, 8, 219, 54),
              highlightColor: const Color.fromARGB(171, 0, 255, 21),
              color: const Color.fromARGB(228, 219, 152, 26),
              onPressed: () {
                if (ac_no == "1") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac1()));
                } else if (ac_no == "2") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac2()));
                } else if (ac_no == "3") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac3()));
                } else if (ac_no == "4") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac4()));
                } else if (ac_no == "5") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac5()));
                } else if (ac_no == "6") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac6()));
                } else if (ac_no == "7") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac7()));
                } else if (ac_no == "8") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac8()));
                } else if (ac_no == "9") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac9()));
                } else if (ac_no == "10") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac10()));
                } else if (ac_no == "11") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac11()));
                } else if (ac_no == "12") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac12()));
                } else if (ac_no == "13") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac13()));
                } else if (ac_no == "14") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac14()));
                } else if (ac_no == "15") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac15()));
                } else if (ac_no == "16") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac16()));
                } else if (ac_no == "17") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac17()));
                } else if (ac_no == "18") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac18()));
                } else if (ac_no == "19") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac19()));
                } else if (ac_no == "20") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac20()));
                } else if (ac_no == "21") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac21()));
                } else if (ac_no == "22") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac22()));
                } else if (ac_no == "23") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac23()));
                } else if (ac_no == "24") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac24()));
                } else if (ac_no == "25") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac25()));
                } else if (ac_no == "26") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac26()));
                } else if (ac_no == "27") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac27()));
                } else if (ac_no == "28") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac28()));
                } else if (ac_no == "29") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac29()));
                } else if (ac_no == "30") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac30()));
                } else if (ac_no == "31") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac31()));
                } else if (ac_no == "32") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac32()));
                } else if (ac_no == "33") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac33()));
                } else if (ac_no == "34") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac34()));
                } else if (ac_no == "35") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac35()));
                } else if (ac_no == "36") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac36()));
                } else if (ac_no == "37") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac37()));
                } else if (ac_no == "38") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac38()));
                } else if (ac_no == "39") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac39()));
                } else if (ac_no == "40") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac40()));
                } else if (ac_no == "41") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac41()));
                } else if (ac_no == "42") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac42()));
                } else if (ac_no == "43") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac43()));
                } else if (ac_no == "44") {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Ac44()));
                } else {
                  print("Please check the Spellings of the RSU");
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit_note),
              // splashColor:
              // const Color.fromARGB(255, 8, 219, 54),
              highlightColor: const Color.fromARGB(171, 0, 255, 21),
              color: const Color.fromARGB(228, 219, 152, 26),
              onPressed: () {
                String acEditId = id;
                _showMyEditableDialog(acEditId, room_or_area_name);
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward),
              // splashColor:
              // const Color.fromARGB(255, 8, 219, 54),
              highlightColor: const Color.fromARGB(171, 0, 255, 21),
              color: const Color.fromARGB(186, 10, 73, 2),
              onPressed: () {
                //alert eken database 1 haraha labaganna targetid eka laba deema.
                String acId = id;
                _showMyDialog(ac_no, acId, room_or_area_name,
                    model_no); // alert ekata adala object/function name eka thama methana call krnne
              },
            )
          ],
        ),
      ],
    );
  }

// alert ekak display wena object eka. meka _HomePageState class eka athule build object ekata pitin aluth object 1k wdyata thama add krnne
  // ignore: unused_element
  Future<void> _showMyDialog(ac_no, acId, room_or_area_name, model_no) async {
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
                room_or_area_name,
                style: const TextStyle(
                    //backgroundColor: Color.fromARGB(66, 156, 156, 156),
                    wordSpacing: 5,
                    color: Colors.green),
                textScaleFactor: 1.0,
              ),
              Text(
                model_no,
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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Cooling Sufficient :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtCoolingSufficient,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Condition of indoor plant :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtIndoorplantcondition,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Condition of outdoor plant :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtOutdoorplantcondition,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Remark / Comments :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtRemarkorComment,
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
                            Text('${date1.year}/${date1.month}/${date1.day}')),
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
                    String coolingsufficient = txtCoolingSufficient.text;
                    String indoorplantcondition = txtIndoorplantcondition.text;
                    String outdoorplantcondition =
                        txtOutdoorplantcondition.text;
                    String remarkorcomment = txtRemarkorComment.text;

                    if (ac_no == "1") {
                      FirebaseFirestore.instance
                          .collection("repairac1") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "2") {
                      FirebaseFirestore.instance
                          .collection("repairac2") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "3") {
                      FirebaseFirestore.instance
                          .collection("repairac3") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "4") {
                      FirebaseFirestore.instance
                          .collection("repairac4") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "5") {
                      FirebaseFirestore.instance
                          .collection("repairac5") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "6") {
                      FirebaseFirestore.instance
                          .collection("repairac6") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "7") {
                      FirebaseFirestore.instance
                          .collection("repairac7") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "8") {
                      FirebaseFirestore.instance
                          .collection("repairac8") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "9") {
                      FirebaseFirestore.instance
                          .collection("repairac9") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "10") {
                      FirebaseFirestore.instance
                          .collection("repairac10") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "11") {
                      FirebaseFirestore.instance
                          .collection("repairac11") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "12") {
                      FirebaseFirestore.instance
                          .collection("repairac12") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "13") {
                      FirebaseFirestore.instance
                          .collection("repairac13") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "14") {
                      FirebaseFirestore.instance
                          .collection("repairac14") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "15") {
                      FirebaseFirestore.instance
                          .collection("repairac15") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "16") {
                      FirebaseFirestore.instance
                          .collection("repairac16") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "17") {
                      FirebaseFirestore.instance
                          .collection("repairac17") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "18") {
                      FirebaseFirestore.instance
                          .collection("repairac18") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "19") {
                      FirebaseFirestore.instance
                          .collection("repairac19") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "20") {
                      FirebaseFirestore.instance
                          .collection("repairac20") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "21") {
                      FirebaseFirestore.instance
                          .collection("repairac21") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "22") {
                      FirebaseFirestore.instance
                          .collection("repairac22") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "23") {
                      FirebaseFirestore.instance
                          .collection("repairac23") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "24") {
                      FirebaseFirestore.instance
                          .collection("repairac24") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "25") {
                      FirebaseFirestore.instance
                          .collection("repairac25") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "26") {
                      FirebaseFirestore.instance
                          .collection("repairac26") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "27") {
                      FirebaseFirestore.instance
                          .collection("repairac27") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "28") {
                      FirebaseFirestore.instance
                          .collection("repairac28") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "29") {
                      FirebaseFirestore.instance
                          .collection("repairac29") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "30") {
                      FirebaseFirestore.instance
                          .collection("repairac30") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "31") {
                      FirebaseFirestore.instance
                          .collection("repairac31") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "32") {
                      FirebaseFirestore.instance
                          .collection("repairac32") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "33") {
                      FirebaseFirestore.instance
                          .collection("repairac33") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "34") {
                      FirebaseFirestore.instance
                          .collection("repairac34") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "35") {
                      FirebaseFirestore.instance
                          .collection("repairac35") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "36") {
                      FirebaseFirestore.instance
                          .collection("repairac36") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "37") {
                      FirebaseFirestore.instance
                          .collection("repairac37") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "38") {
                      FirebaseFirestore.instance
                          .collection("repairac38") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "39") {
                      FirebaseFirestore.instance
                          .collection("repairac39") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "40") {
                      FirebaseFirestore.instance
                          .collection("repairac40") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "41") {
                      FirebaseFirestore.instance
                          .collection("repairac41") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "42") {
                      FirebaseFirestore.instance
                          .collection("repairac42") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "43") {
                      FirebaseFirestore.instance
                          .collection("repairac43") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else if (ac_no == "44") {
                      FirebaseFirestore.instance
                          .collection("repairac44") //"contributions"
                          .add({
                        'room_or_area_name': room_or_area_name,
                        'last_repaired_date': date1,
                        'cooling_sufficient': coolingsufficient,
                        'indoor_plant_condition': indoorplantcondition,
                        'outdoor_plant_condition': outdoorplantcondition,
                        'remark_or_comment': remarkorcomment,
                        'next_repairing_date': date2,
                        'ac_id': acId,
                      });
                    } else {
                      print(
                          "Please check the Spellings of the Room or Area name");
                    }

                    FirebaseFirestore.instance
                        .collection("repaiac") //"contributions"
                        .add({
                      'room_or_area_name_r': room_or_area_name,
                      'last_repaired_date_r': date1,
                      'cooling_sufficient_r': coolingsufficient,
                      'indoor_plant_condition_r': indoorplantcondition,
                      'outdoor_plant_condition_r': outdoorplantcondition,
                      'remark_or_comment_r': remarkorcomment,
                      'next_repairing_date_r': date2,
                      'ac_id_r': acId,
                    });

                    //database eke data update karana code kotasak
                    // mehidi "targets" table eke "contribution_tota" kiyana document eka thama update krnne.
                    FirebaseFirestore.instance
                        .collection('addac')
                        .doc(acId)
                        .update({
                      'last_repaired_date_a': date1,
                      'cooling_sufficient_a': coolingsufficient,
                      'next_repairing_date_a': date2,
                      'condition_of_indoor_plant_a': indoorplantcondition,
                      'condition_of_outdoor_plant_a': outdoorplantcondition,
                      'remark_or_comment_a': remarkorcomment,

                      //mehidi tiyana contribution total value ekatama aluth contribution eka ekathu wela update wenna ona nisai "FieldValue.increment()" use krnne.
                      // delete krnna onenm "FieldValue.delete()" wage wenas kra kra update kirim krnna plwn
                    });

                    // date1 = null;
                    txtCoolingSufficient.clear();
                    txtIndoorplantcondition.clear();
                    txtOutdoorplantcondition.clear();
                    txtRemarkorComment.clear();

                    // txtAmount.clear(); use krnnath plwn
                    //date2 = null;
                    //txtNote.clear(); use krnnath plwn
                    Navigator.of(context)
                        .pop(); // popup eka remove krnwa display eken
                  },
                ),
                TextButton(
                  onPressed: () {
                    //date1 = null;
                    txtCoolingSufficient.clear();
                    txtIndoorplantcondition.clear();
                    txtOutdoorplantcondition.clear();
                    txtRemarkorComment.clear();
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
  Future<void> _showMyEditableDialog(acEditId, room_or_area_name) async {
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
            'Edit Repairing Details',
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
                  'Cooling Sufficient :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtCoolingSufficientEdit,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Condition of indoor plant :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtIndoorplantconditionEdit,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Condition of outdoor plant :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtOutdoorplantconditionEdit,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Remark / Comments :',
                  textScaleFactor: 0.9,
                ),
                TextFormField(
                  controller: txtRemarkorCommentEdit,
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

                    String coolingsufficientedit =
                        txtCoolingSufficientEdit.text;
                    String indoorplantconditionedit =
                        txtIndoorplantconditionEdit.text;
                    String outdoorplantconditionedit =
                        txtOutdoorplantconditionEdit.text;
                    String remarkorcommentedit = txtRemarkorCommentEdit.text;

                    //database eke data update karana code kotasak
                    // mehidi "targets" table eke "contribution_tota" kiyana document eka thama update krnne.
                    /*  FirebaseFirestore.instance
                        .collection('repairac')
                        .doc('bZq1uxBXND60fO3aaOyU')
                        .update({
                      'room_or_area_name': room_or_area_name,
                      'last_repaired_date': date1,
                      'cooling_sufficient': coolingsufficientedit,
                      'indoor_plant_condition': indoorplantconditionedit,
                      'outdoor_plant_condition': outdoorplantconditionedit,
                      'remark_or_comment': remarkorcommentedit,
                      'next_repairing_date': date2,

                      //mehidi tiyana contribution total value ekatama aluth contribution eka ekathu wela update wenna ona nisai "FieldValue.increment()" use krnne.
                      // delete krnna onenm "FieldValue.delete()" wage wenas kra kra update kirim krnna plwn
                    }); */
                    FirebaseFirestore.instance
                        .collection('addac')
                        .doc(acEditId)
                        .update({
                      'room_or_area_name_a': room_or_area_name,
                      'last_repaired_date_a': date3,
                      'cooling_sufficient_a': coolingsufficientedit,
                      'condition_of_indoor_plant_a': indoorplantconditionedit,
                      'condition_of_outdoor_plant_a': outdoorplantconditionedit,
                      'remark_or_comment_a': remarkorcommentedit,
                      'next_repairing_date_a': date4,

                      //mehidi tiyana contribution total value ekatama aluth contribution eka ekathu wela update wenna ona nisai "FieldValue.increment()" use krnne.
                      // delete krnna onenm "FieldValue.delete()" wage wenas kra kra update kirim krnna plwn
                    });
                    //date3 = null;
                    txtCoolingSufficientEdit.clear();
                    txtIndoorplantconditionEdit.clear();
                    txtOutdoorplantconditionEdit.clear();
                    txtRemarkorCommentEdit.clear();

                    //date4 = null;
                    //txtNote.clear(); use krnnath plwn
                    Navigator.of(context)
                        .pop(); // popup eka remove krnwa display eken
                  },
                ),
                TextButton(
                  onPressed: () {
                    //date3 = null;
                    txtCoolingSufficientEdit.clear();
                    txtIndoorplantconditionEdit.clear();
                    txtOutdoorplantconditionEdit.clear();
                    txtRemarkorCommentEdit.clear();
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
