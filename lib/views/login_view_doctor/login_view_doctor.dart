
import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/res/components/custom_elevated_button.dart';
import 'package:doctor_app/views/book_appointment_view/book_appointment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginViewDoctor extends StatefulWidget {
  const LoginViewDoctor({super.key});

  @override
  State<LoginViewDoctor> createState() => _LoginViewDoctorState();
}

class _LoginViewDoctorState extends State<LoginViewDoctor> {
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
                        const Text("Doctor Name",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        ),
                        const Gap(5),
                        const Text("Category"),
                        const Gap(25),
                        VxRating(onRatingUpdate: (value) {},
                          selectionColor: Colors.yellow,
                          count: 5,
                          maxRating: 5,
                          value: 4,
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
                        title: const Text("Phone Number",style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 25.0
                        ),
                        ),
                        subtitle: const Text("+9212345678",style: TextStyle(
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
                      const Text("About",style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 25.0
                      ),
                      ),
                      const Text("This is the about section",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                      ),
                      const Text("Address",style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 25.0
                      ),
                      ),
                      const Text("Address of the doctor",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                      ),
                      const Text("Working Time",style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 25.0
                      ),
                      ),
                      const Text("9:00 to 12:00",style: TextStyle(
                         fontWeight: FontWeight.bold
                      ),
                      ),
                      const Text("Service",style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 25.0
                      ),
                      ),
                      const Text("This is the service section of the doctor",style: TextStyle(
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
          Get.to((BookAppointmentView()));
        }),
      ),
    );
  }
}
