import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ControllLightPage extends StatefulWidget {
  @override
  _ControllLightPageState createState() => _ControllLightPageState();
}

class _ControllLightPageState extends State<ControllLightPage> {
  final databaseReference = FirebaseDatabase.instance.reference();

  String status1 = "off";
  String status2 = "off";
  String status3 = "off";

  void onChangedStatus(int i, String s) {
    setState(() {
      if (s == "off") {
        if (i == 1) {
          status1 = "on";

          databaseReference.update({"led1": "room_a_on"});
        } else if (i == 2) {
          status2 = "on";
          databaseReference.update({'led1': 'room_b_on'});
        } else {
          status3 = "on";
          databaseReference.update({'led1': 'room_c_on'});
        }
      } else {
        if (i == 1) {
          status1 = "off";
          databaseReference.update({'led1': 'room_a_off'});
        } else if (i == 2) {
          status2 = "off";
          databaseReference.update({'led1': 'room_b_off'});
        } else {
          status3 = "off";
          databaseReference.update({'led1': 'room_c_off'});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Iluminação das Salas".toUpperCase(),
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          SizedBox(height: 20.0),
          Text("Sala 302 A".toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blueGrey)),
          Container(
              height: 150.0,
              child: GestureDetector(
                onTap: () {
                  onChangedStatus(1, status1);
                },
                child: Image.asset("images/lamp_$status1.png"),
              )),
          SizedBox(height: 20.0),
          Text("Sala 302 B".toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blueGrey)),
          Container(
              height: 150.0,
              child: GestureDetector(
                onTap: () {
                  onChangedStatus(2, status2);
                },
                child: Image.asset("images/lamp_$status2.png"),
              )),
          SizedBox(height: 20.0),
          Text("Sala 302 C".toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.blueGrey)),
          Container(
              height: 150.0,
              child: GestureDetector(
                onTap: () {
                  onChangedStatus(3, status3);
                },
                child: Image.asset("images/lamp_$status3.png"),
              ))
        ],
      ),
    );
  }
}
