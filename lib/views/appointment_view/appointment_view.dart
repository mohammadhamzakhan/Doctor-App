import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/views/appointment_details/appointment_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Appointments",style: TextStyle(
            color: Colors.white
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 6,
            itemBuilder: (context,index){
              return ListTile(
                onTap: (){
                  Get.to(()=>AppointmentDetails());

                },
                leading: CircleAvatar(
                  child: Image.asset(AppAssets.signUp),
                ),
                title: Text("Doctor Name"),
                subtitle: Text("Appintment Details"),
              );
            }),
      ),
    );
  }
}
