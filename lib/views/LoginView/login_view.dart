import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/consts/strings.dart';
import 'package:doctor_app/controllers/auth_controller.dart';
import 'package:doctor_app/res/components/custom_elevated_button.dart';
import 'package:doctor_app/res/components/custom_text_button.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:doctor_app/views/Home/home.dart';
import 'package:doctor_app/views/SignupView/signup_view.dart';
import 'package:doctor_app/views/appointment_view/appointment_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../forgot_password/forgot_password_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isDoctor = false;


  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
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
                      CustomTextField(
                        hint: "Email",
                        textController: controller.emailController,
                      ),
                      const Gap(15),
                      CustomTextField(
                        // obsecureText: loginHidden,
                        hint: "Password",
                        textController: controller.passwordController,
                      ),
                      const Gap(7),
                      SwitchListTile(
                        value: isDoctor,
                        onChanged: (newValue) {
                          setState(() {
                            isDoctor = newValue;
                          });
                        },
                        title: "Sign in as a doctor".text.make(),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextButton(
                            buttonText: "ForgotPassword?",
                            onTap: () {
                              Get.to(() => ForgotPassword());
                            }),
                      ),
                      const Gap(30),
                      CustomElevatedButton(
                          buttonText: "Login",
                          onTap: () async {
                            await controller.loginUser();
                            if (controller.userCredential != null) {
                              if (isDoctor) {
                                //  signing as a doctor
                                Get.to((AppointmentView()));
                              } else {
                                // signing as a user
                                Get.to((Home()));
                              }
                            }
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
                              Get.to(() => SignupView());
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
