import 'package:doctor_app/views/Home/home_view.dart';
import 'package:doctor_app/views/appointment_view/appointment_view.dart';
import 'package:doctor_app/views/category/category.dart';
import 'package:doctor_app/views/google_map/google_map.dart';
import 'package:doctor_app/views/setting/setting_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenList = [
    HomeView(),
    AppointmentView(),
    ScreenOne(),
    Category(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
       // backgroundColor: Colors.blue,
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedIconTheme: IconThemeData(color: Colors.brown),
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 28),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book, size: 28),
            label: "Appointment",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on, size: 28),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category, size: 28),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 28),
            label: "Setting",
          ),
        ],
      ),
    );
  }
}
