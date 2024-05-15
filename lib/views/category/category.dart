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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Specialist",style: TextStyle(
          color: Colors.white
        ),),
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
              itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Get.to((CategoryDetailsView(catName: iconTitleList[index],)));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Column(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(iconList[index],width: 70,
                          ),
                        ),
                        const Gap(10),
                        Text(iconTitleList[index],style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                        const Gap(10),
                        Text("13 Specialist")
                
                      ],
                    ),
                
                  ),
              );
              }),
      ),
      );
  }
}
