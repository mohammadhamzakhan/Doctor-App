import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/controllers/appointment_controller.dart';
import 'package:doctor_app/controllers/auth_controller.dart';
import 'package:doctor_app/views/appointment_details/appointment_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentView extends StatelessWidget {
  final bool isDoctor;
  const AppointmentView({super.key, this.isDoctor = false});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: const Text(
          "Appointments",
          style: TextStyle(color: Colors.white),
        ),
        actions: isDoctor
            ? [
          IconButton(
            onPressed: () {
              AuthController().signout();
            },
            icon: Icon(Icons.power_settings_new_outlined),
          ),
        ]
            : null, // Hides the button if isDoctor is false
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: controller.getAppointments(isDoctor),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data?.docs;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: ListView.builder(
                itemCount: data?.length ?? 0,
                itemBuilder: (context, index) {
                  var doc = data![index];
                  return ListTile(
                    onTap: () {
                      Get.to(() => AppointmentDetails(doc: doc));
                    },
                    leading: CircleAvatar(
                      child: Image.asset(AppAssets.signUp),
                    ),
                    title: Text(doc[!isDoctor ? 'appWithName' : 'appName']),
                    subtitle: Text("${doc['appDay']} - ${doc['appTime']}"),
                    trailing: isDoctor
                        ? null
                        : IconButton(
                      icon: Icon(Icons.delete, color: Colors.black),
                      onPressed: () {
                        _showDeleteConfirmationDialog(context, doc.id);
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, String docId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Appointment"),
          content: Text("Are you sure you want to delete this appointment?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Delete"),
              onPressed: () {
                _deleteAppointment(docId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteAppointment(String docId) {
    FirebaseFirestore.instance
        .collection('appointments')
        .doc(docId)
        .delete()
        .then((_) {
      Get.snackbar("Success", "Appointment deleted successfully",
          snackPosition: SnackPosition.BOTTOM);
    }).catchError((error) {
      Get.snackbar("Error", "Failed to delete appointment",
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
