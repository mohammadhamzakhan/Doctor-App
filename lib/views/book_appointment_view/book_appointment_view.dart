import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../res/components/custom_elevated_button.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Doctor Name",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select appointment day",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              CustomTextField(hint: "Select day"),
              const Gap(20),
              Text(
                "Select appointment time",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              CustomTextField(hint: "Select time"),
              const Gap(20),
              Text(
                "Mobile Number",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              CustomTextField(hint: "Enter Your Mobile Number"),
              const Gap(20),
              Text(
                "Full Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              CustomTextField(hint: "Enter Your Name"),
              const Gap(20),
              Text(
                "Message",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              CustomTextField(hint: "Enter Your Message"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CustomElevatedButton(
            buttonText: "Book an appointment",
            onTap: () {
              Get.to((BookAppointmentView()));
            }),
      ),
    );
  }
}
