import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/consts/strings.dart';
import 'package:doctor_app/res/components/custom_elevated_button.dart';
import 'package:doctor_app/res/components/custom_text_button.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:doctor_app/views/LoginView/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
 const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                AppAssets.signUp,
                width: 150,
              ),
              const Gap(5),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  AppStrings.signupNow,
                  style: const TextStyle(fontFamily: "Lobster", fontSize: 30),
                ),
              ),
              const Gap(5),

            ]),
            const Gap(30),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      CustomTextField(hint: "Name"),
                      const Gap(15),
                      CustomTextField(hint: "Email"),
                      const Gap(15),
                      CustomTextField(hint: "Password"),
                      const Gap(40),
                      CustomElevatedButton(buttonText: "Signup", onTap: () {}),
                      const Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.dontHaveAccount,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const Gap(10),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const  Text("Login"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
