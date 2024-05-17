import 'package:doctor_app/res/components/waiting_screen.dart';
import 'package:doctor_app/views/LoginView/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade500,

        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.grey.shade500
        )
      ),

      debugShowCheckedModeBanner: false,
      home: WaitingScreen(),
    );
  }
}
