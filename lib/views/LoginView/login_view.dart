import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/consts/strings.dart';
import 'package:doctor_app/res/components/custom_elevated_button.dart';
import 'package:doctor_app/res/components/custom_text_button.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:doctor_app/views/Home/home_view.dart';
import 'package:doctor_app/views/SignupView/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                AppAssets.login,
                width: 300,
              ),
              const Gap(20),
              Text(
                AppStrings.welcomeBack,
                style: const TextStyle(fontFamily: "Lobster", fontSize: 30),
              ),
              const Gap(5),
              Text(
                AppStrings.weAreExcited,
                style: const TextStyle(fontFamily: "Lobster", fontSize: 25),
              )
            ]),
            const Gap(30),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  child: Column(
                    children: [
                      CustomTextField(hint: "Email"),
                      const Gap(15),
                      CustomTextField(hint: "Password"),
                      const Gap(7),
                      Align(
                          alignment: Alignment.centerRight,
                          child: CustomTextButton(
                              buttonText: "ForgotPassword?", onTap: () {})),
                      const Gap(30),
                      CustomElevatedButton(buttonText: "Login", onTap: () {
                        Get.to(()=>HomeView());
                      }),
                      const Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.dontHaveAccount,
                            style: TextStyle(fontSize: 15),
                          ),
                          const Gap(10),
                          TextButton(
                            onPressed: () {
                              Get.to(()=> const SignupView());
                            },
                            child: Text("SignUp"),
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
