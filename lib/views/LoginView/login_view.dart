import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../consts/images.dart';
import '../../consts/strings.dart';
import '../../controllers/auth_controller.dart';
import '../../res/components/custom_elevated_button.dart';
import '../../res/components/custom_text_button.dart';
import '../../res/components/custom_textfield.dart';
import '../Home/home.dart';
import '../SignupView/signup_view.dart';
import '../appointment_view/appointment_view.dart';
import '../forgot_password/forgot_password_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation

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
                style: const TextStyle(fontFamily: "Lobster", fontSize: 40,color: Colors.green),
              ),
              const Gap(5),
              Text(
                AppStrings.weAreExcited,
                style: const TextStyle(fontFamily: "Lobster", fontSize: 25,color: Colors.black87),
              )
            ]),
            const Gap(30),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey, // Assigning form key
                  child: Column(
                    children: [
                      CustomTextField(
                        hint: "Email",
                        textController: controller.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!GetUtils.isEmail(value)) {
                            return 'Please enter a valid email address';
                          }
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
                          if (value.length < 6) {
                            return 'Password should be at least 6 characters long';
                          }
                          return null;
                        },
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
                            Get.to(() => const ForgotPassword());
                          },
                        ),
                      ),
                      const Gap(30),
                      CustomElevatedButton(
                        buttonText: "Login",
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            // Form is valid, proceed with login
                            await controller.loginUser();
                            if (controller.userCredential != null) {
                              if (isDoctor) {
                                //  signing as a doctor
                                Get.to(() => const AppointmentView());
                              } else {
                                // signing as a user
                                Get.to(() => const Home());
                              }
                            }
                          }
                        },
                      ),
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
                              Get.to(() => const SignupView());
                            },
                            child: const Text("SignUp"),
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
