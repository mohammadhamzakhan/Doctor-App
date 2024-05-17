import 'package:doctor_app/consts/lists.dart';
import 'package:doctor_app/views/category_detail_view/category_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.grey.shade200; // Define primary color
    Color secondaryColor = Colors.grey.shade600; // Define secondary color
    Color textColor = Colors.black; // Define text color
    return Scaffold(
      appBar: AppBar(
        //   backgroundColor: Colors.blue,
        title: const Text(
          "Specialist",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 13,
              mainAxisExtent: 230,
            ),
            itemCount: iconList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to((CategoryDetailsView(
                    catName: iconTitleList[index],
                  )));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.black26,
                      Colors.grey.shade300
                    ]),


                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          iconList[index],
                          width: 120,
                          height: 120,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        iconTitleList[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
