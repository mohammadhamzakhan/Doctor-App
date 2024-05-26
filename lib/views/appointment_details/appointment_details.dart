import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentDetails extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppointmentDetails({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.blue,
        title: Text(
          doc['appWithName'],
          style: TextStyle(
            color: Colors.white,

          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select appointment day",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Gap(10),
            Text(
              doc['appDay'],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const Gap(20),
            Text(
              "Select appointment time",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Gap(10),
            Text(
              doc['appTime'],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const Gap(20),
            Text(
              "Mobile Number",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Gap(10),
            Text(
              doc['appPhone'],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const Gap(20),
            Text(
              "Full Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Gap(10),
            Text(
              doc['appName'],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const Gap(20),
            Text(
              "Message",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Gap(10),
            Text(
              doc['appMessage'],
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
