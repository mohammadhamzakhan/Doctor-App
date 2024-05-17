import 'package:doctor_app/views/setting/about_us.dart';
import 'package:doctor_app/views/setting/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/images.dart';
import '../../consts/lists.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/setting_controller.dart';
import '../LoginView/login_view.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  var controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Colors.blue,
        title: Text(
          "Setting",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(
            () => controller.isLoading.value
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Image.asset(AppAssets.signUp),
              ),
              title: Text(controller.username.value),
              subtitle: Text(controller.email.value),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: settingList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    if (index == 2) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Sign Out"),
                            content: Text("Are you sure you want to sign out?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  AuthController().signout();
                                  Get.offAll(() => LoginView());
                                },
                                child: Text("Sign Out"),
                              ),
                            ],
                          );
                        },
                      );
                    } else if(index ==0){
                      Get.to(()=>TermsAndConditionsScreen());
                    }
                    else if(index ==1
                    ){
                      Get.to(()=>AboutUsScreeen());
                    }
                  },
                  title: Text(settingList[index]),
                  leading: Icon(
                    settingListIcon[index],
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
