
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/controllers/appointment_controller.dart';
import 'package:doctor_app/res/components/custom_elevated_button.dart';
import 'package:doctor_app/views/book_appointment_view/book_appointment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginViewDoctor extends StatelessWidget {
  final DocumentSnapshot doc;
  const LoginViewDoctor({super.key,required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:const Text("Doctor Details",style: TextStyle(
        ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                  color: const Color(0xffdfe9f3)
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(

                      AppAssets.signUp,

                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(doc['docName'],style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                        const Gap(5),
                         Text(doc['docCategory']),
                        const Gap(25),
                        VxRating(onRatingUpdate: (value) {},
                          selectionColor: Colors.yellow,
                          count: 5,
                          maxRating: 5,
                          value: double.parse(doc['docRating'].toString()),
                          stepInt: true,
                        ),
                      ],
                    ),
                  ),
                  TextButton(onPressed: (){}, child: const Text("See all Views"))
                ],
              ),
            ),
          ),
           Padding(
             padding: const EdgeInsets.all(12),
             child: Container(
               padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xffdfe9f3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title:  Text("Phone Number",style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 25.0
                        ),
                        ),
                        subtitle:  Text(doc['docPhone'],style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        trailing: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Icon(Icons.phone,size: 40,color: Colors.green,),
                        ),
                      ),
                       Text("About",style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 25.0
                      ),
                      ),
                       Text(doc['docAbout'],style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                      ),
                      const Text("Address",style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 25.0
                      ),
                      ),
                       Text(doc['docAddress'],style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                      ),
                      const Text("Working Time",style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 25.0
                      ),
                      ),
                       Text(doc['docTiming'],style: TextStyle(
                         fontWeight: FontWeight.bold
                      ),
                      ),
                      const Text("Service",style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 25.0
                      ),
                      ),
                       Text(doc['docService'],style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                      ),


                    ],
                  ),
                ),

              ),
           ),

        ],

      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18.0),
        child: CustomElevatedButton(buttonText: "Book an appointment", onTap: (){
          Get.to((BookAppointmentView(docId: doc['docId'],docName: doc['docName'],)));
        }),
      ),
    );
  }
}
