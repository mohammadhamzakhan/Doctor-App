import 'package:doctor_app/views/Home/home_view.dart';
import 'package:doctor_app/views/appointment_view/appointment_view.dart';
import 'package:doctor_app/views/category/category.dart';
import 'package:doctor_app/views/setting/setting_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List screenList = [HomeView(), AppointmentView(), Category(), SettingView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedLabelStyle: TextStyle(color: Colors.white),
        selectedIconTheme: IconThemeData(color: Colors.white),
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
