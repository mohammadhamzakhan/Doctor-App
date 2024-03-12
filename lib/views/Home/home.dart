import 'package:doctor_app/views/Home/home_view.dart';
import 'package:doctor_app/views/appointment_view/appointment_view.dart';
import 'package:doctor_app/views/category/category.dart';
import 'package:doctor_app/views/setting/setting_view.dart';
import 'package:flutter/material.dart';

import '../LoginView/login_view.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {

  int selectedIndex = 0;
  List screenList = [
    HomeView(),
    AppointmentView(),
    Category(),
    LoginView(),
    SettingView()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedLabelStyle: TextStyle(
          color: Colors.white
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.white
        ),
        currentIndex: selectedIndex,
        onTap: (value){
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book),label: "Appointment"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Person"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
        ],
      ),
    );
  }
}
