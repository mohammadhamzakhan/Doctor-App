import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppointmentDetails extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppointmentDetails({super.key,required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  Text(doc['appWithName'],style: TextStyle(
            color: Colors.white
        ),
        ),
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Select appointment day",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(10),
         Text(
            doc['appDay'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(20),
          Text(
            "Select appointment time",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Text(
            doc['appTime'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(20),
          Text(
            "Mobile Number",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Text(
            doc['appPhone'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(20),
          Text(
            "Full Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Text(
            doc['appName'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(20),
          Text(
            "Message",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Text(
            doc['appMessage'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
