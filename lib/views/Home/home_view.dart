import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/consts/lists.dart';
import 'package:doctor_app/controllers/home_controller.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:doctor_app/views/category_detail_view/category_details_view.dart';
import 'package:doctor_app/views/login_view_doctor/login_view_doctor.dart';
import 'package:doctor_app/views/search_view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../controllers/setting_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final List symptoms = [
    "Temperature",
    "Snuffle",
    "Fever",
    "Cough",
    "Cold",
  ];

  @override
  Widget build(BuildContext context) {
    var controller2 = Get.put(SettingController());
    var controller = Get.put(HomeController());

    Color primaryColor = Colors.grey.shade200; // Define primary color
    Color secondaryColor = Colors.grey.shade600; // Define secondary color
    Color textColor = Colors.black; // Define text color

    return Scaffold(
      appBar: AppBar(
      //  backgroundColor: Colors.grey.shade500,
        title: Text(
          'Welcome'+" "+controller2.username.value,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(13),
              //color: primaryColor,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      textController: controller.searchQueryController,
                      iconButton: IconButton(
                        onPressed: () {
                          Get.to(() => SearchView(
                              searchQuery:
                              controller.searchQueryController.text));
                        },
                        icon: Icon(
                          Icons.search,
                          color: secondaryColor,
                        ),
                      ),
                      hint: "Search Doctor",
                      borderColor: secondaryColor,
                      enableColor: secondaryColor,
                      textFieldColor: secondaryColor,
                      inputColor: secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => CategoryDetailsView(
                                catName: iconTitleList[index]));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: secondaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  iconList[index],
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  iconTitleList[index],
                                  style: TextStyle(color: textColor),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Gap(10),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "What are your symptoms?",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: symptoms.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF4F6FA),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              symptoms[index],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Gap(5),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "Popular Doctors",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const Gap(5),
                  SizedBox(
                    height: 300, // Set a fixed height for the grid view
                    child: FutureBuilder<QuerySnapshot>(
                      future: controller.getDoctorList(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          var data = snapshot.data?.docs;
                          return GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemCount: data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to((LoginViewDoctor(doc: data![index])));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.white70,
                                        width: 200,
                                        height: 130,
                                        child: Image.asset(
                                          AppAssets.signUp,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Text(
                                        data![index]['docName'],
                                      ),
                                      Text(
                                        data[index]['docCategory'],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
