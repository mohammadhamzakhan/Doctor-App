import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/consts/lists.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:doctor_app/views/login_view_doctor/login_view_doctor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Welcome User",
          style: TextStyle(color: Colors.white, fontFamily: "Lobster"),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(13),
            color: Colors.blue,
            child: Row(children: [
              Expanded(
                child: CustomTextField(
                  hint: "Search Doctor",
                  borderColor: Colors.white,
                  enableColor: Colors.white,
                  textFieldColor: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ]),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(15),
                            margin: EdgeInsets.only(right: 11),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15)),
                            height: 50,
                            width: 90,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  child: Image.asset(
                                    iconList[index],
                                    //width: 80,
                                    // color: Colors.white,
                                  ),
                                ),
                                const Gap(10),
                                Text(
                                  iconTitleList[index],
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const Gap(20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Popular Doctors"),
                ),
                const Gap(15),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: (){
                            Get.to((LoginViewDoctor()));
                          },
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                Container(
                                  width: 130,
                                  height: 120,
                                  color: Colors.grey.shade500,
                                  child: Image.asset(
                                    fit: BoxFit.fill,
                                    AppAssets.signUp,
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                                const Text(
                                  'Doctor',
                                  style: TextStyle(),
                                ),
                                const Text(
                                  'Category',
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                const Gap(20),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text("View All"),
                  ),
                ),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    4,
                    (index) => Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12)),
                      height: 90,
                      width: 70,
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        Image.asset(color: Colors.white, AppAssets.icBody),
                        Text(
                          "Faiz",
                          style: TextStyle(color: Colors.white),
                        )
                      ]),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
