import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/consts/strings.dart';
import 'package:doctor_app/controllers/auth_controller.dart';
import 'package:doctor_app/res/components/custom_elevated_button.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:doctor_app/views/appointment_view/appointment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  var isDoctor = false;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
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
                  key: _formKey, // Assigning form key
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: "Name",
                        textController: controller.fullNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const Gap(15),
                      CustomTextField(
                        hint: "Email",
                        textController: controller.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // Add email validation logic if needed
                          return null;
                        },
                      ),
                      const Gap(15),
                      CustomTextField(
                        obscureText: true,
                        hint: "Password",
                        textController: controller.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          // Add password validation logic if needed
                          return null;
                        },
                      ),
                      const Gap(15),
                      SwitchListTile(
                        value: isDoctor,
                        onChanged: (newValue) {
                          setState(() {
                            isDoctor = newValue;
                          });
                        },
                        title: "Sign Up as a doctor".text.make(),
                      ),
                      Visibility(
                        visible: isDoctor,
                        child: Column(
                          children: [
                            CustomTextField(
                              hint: "About",
                              textController: controller.aboutController,
                            ),
                            const Gap(15),
                            CustomTextField(
                              hint: "Category",
                              textController: controller.categoryController,
                            ),
                            const Gap(15),
                            CustomTextField(
                              hint: "Service",
                              textController: controller.serviceController,
                            ),
                            const Gap(15),
                            CustomTextField(
                              hint: "Address",
                              textController: controller.addressController,
                            ),
                            const Gap(15),
                            CustomTextField(
                              hint: "Phone Number",
                              textController: controller.phoneController,
                            ),
                            const Gap(15),
                            CustomTextField(
                              hint: "Timing",
                              textController: controller.timingController,
                            ),
                          ],
                        ),
                      ),
                      const Gap(40),
                      CustomElevatedButton(
                        buttonText: "Signup",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            // Form is valid, proceed with signup
                            await controller.signupUser(isDoctor);
                            if (controller.userCredential != null) {
                              Get.offAll(() => AppointmentView());
                            }
                          }
                        },
                      ),
                      const Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.alreadyHaveAccount,
                            style: const TextStyle(fontSize: 15),
                          ),
                          const Gap(10),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Login"),
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