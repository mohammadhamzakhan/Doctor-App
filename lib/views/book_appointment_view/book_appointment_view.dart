import 'package:doctor_app/controllers/appointment_controller.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../res/components/custom_elevated_button.dart';

class BookAppointmentView extends StatelessWidget {
  final String docId;
  final String docName;
  final _formKey = GlobalKey<FormState>();

  BookAppointmentView({super.key, required this.docId, required this.docName});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          docName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select appointment day",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              CustomTextField(
                hint: "Select day",
                textController: controller.appDayController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a day';
                  }
                  return null;
                },
              ),
              const Gap(20),
              Text(
                "Select appointment time",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              CustomTextField(
                hint: "Select time",
                textController: controller.appTimeController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a time';
                  }
                  return null;
                },
              ),
              const Gap(20),
              Text(
                "Mobile Number",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              CustomTextField(
                hint: "Enter Your Mobile Number",
                textController: controller.appPhoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }

                  return null;
                },
              ),
              const Gap(20),
              Text(
                "Full Name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              CustomTextField(
                hint: "Enter Your Name",
                textController: controller.appNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const Gap(20),
              Text(
                "Message",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              CustomTextField(
                hint: "Enter Your Message",
                textController: controller.appMessageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a message';
                  }
                  return null;
                },
              ),
              const Gap(20),
              Obx(
                    () => controller.isLoading.value
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : Center(
                      child: CustomElevatedButton(
                                        buttonText: "Book an appointment",
                                        onTap: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        await controller.bookAppointment(docId, docName, context);
                      }
                                        },
                                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
