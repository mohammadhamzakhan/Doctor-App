import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/res/components/custom_elevated_button.dart';
import 'package:doctor_app/views/book_appointment_view/book_appointment_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginViewDoctor extends StatelessWidget {
  final DocumentSnapshot doc;
  const LoginViewDoctor({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    TextStyle text = TextStyle(fontFamily: 'RobotoSlab', color: Colors.blue, fontSize: 25);
    TextStyle text2 = TextStyle(fontFamily: 'RobotoSlab', color: Colors.red, fontSize: 16);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Doctor Details",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 130,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400, width: 2.0),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 50,
                    backgroundImage: AssetImage(AppAssets.signUp),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          doc['docName'],
                          style: text,
                        ),
                        const Gap(5),
                        Text(doc['docCategory'], style: text2),
                        const Gap(15),
                        VxRating(
                          onRatingUpdate: (value) {},
                          selectionColor: Colors.yellow,
                          count: 5,
                          maxRating: 5,
                          value: double.parse(doc['docRating'].toString()),
                          stepInt: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 370,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade400, width: 2.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      Text("Phone Number", style: text),
                      const SizedBox(height: 5),
                      Text(doc['docPhone'], style: text2),
                      const SizedBox(height: 10),
                      Text("About", style: text),
                      const SizedBox(height: 5),
                      Text(doc['docAbout'], style: text2),
                      const SizedBox(height: 10),
                      Text("Address", style: text),
                      const SizedBox(height: 5),
                      Text(doc['docAddress'], style: text2),
                      const SizedBox(height: 10),
                      Text("Working Time", style: text),
                      const SizedBox(height: 5),
                      Text(doc['docTiming'], style: text2),
                      const SizedBox(height: 10),
                      Text("Services", style: text),
                      const SizedBox(height: 5),
                      Text(doc['docService'], style: text2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(80.0),
        child: CustomElevatedButton(
          buttonText: "Book an appointment",
          onTap: () {
            Get.to(
                  () => BookAppointmentView(
                docId: doc['docId'],
                docName: doc['docName'],
              ),
            );
          },
        ),
      ),
    );
  }
}
