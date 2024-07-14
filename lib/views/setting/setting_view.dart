import 'package:doctor_app/views/setting/about_us.dart';
import 'package:doctor_app/views/setting/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../consts/images.dart';
import '../../consts/lists.dart';

import '../../controllers/setting_controller.dart';
import '../LoginView/login_view.dart';

class SettingView extends StatefulWidget {
  const SettingView({
    super.key,
  });

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  var controller = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
                  const Divider(
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
                                  title: const Text("Sign Out"),
                                  content: const Text(
                                      "Are you sure you want to sign out?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            elevation: 1,
                                            content:
                                                Text('Signout Sucessfully'),
                                          ),
                                        );
                                        //AuthController().signout();
                                        Get.offAll(() => const LoginView());
                                      },
                                      child: const Text("Sign Out"),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (index == 0) {
                            Get.to(() => const TermsAndConditionsScreen());
                          } else if (index == 1) {
                            Get.to(() => const AboutUsScreeen());
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
