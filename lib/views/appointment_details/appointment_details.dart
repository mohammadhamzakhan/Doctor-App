import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Appointments Details",style: TextStyle(
            color: Colors.white
        ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text(
            "Select appointment day",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(10),
         Text(
            "Selected Day",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(20),
          Text(
            "Select appointment time",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Text(
            "Selected time",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(20),
          Text(
            "Mobile Number",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Text(
            "Mobile Number",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(20),
          Text(
            "Full Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Text(
            "Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(20),
          Text(
            "Message",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Text(
            "Message",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
