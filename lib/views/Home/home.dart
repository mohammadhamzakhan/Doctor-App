
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
        bottomNavigationBar: CurvedNavigationBar(
            key: GlobalKey(),
            index: selectedIndex,
            items: <Widget>[
              Icon(Icons.home, size: 30, color: selectedIndex == 0 ? Colors.red : Colors.black87),
              Icon(Icons.book, size: 30, color: selectedIndex == 1 ? Colors.red : Colors.black87),
              Icon(Icons.location_on, size: 30, color: selectedIndex == 2 ? Colors.red : Colors.black87),
              Icon(Icons.category, size: 30, color: selectedIndex == 3 ? Colors.red : Colors.black87),
              Icon(Icons.settings, size: 30, color: selectedIndex == 4 ? Colors.red : Colors.black87),
            ],
            color: Colors.white,
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.grey.shade400,
            animationCurve: Curves.decelerate,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            letIndexChange: (index) => true,
            ),
       );
    }
}