import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/consts/lists.dart';
import 'package:flutter/material.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Setting",style: TextStyle(
          color: Colors.white
        ),),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image.asset(AppAssets.signUp),
            ),
            title: Text("Faiz"),
            subtitle: Text("Faiz@gamil.com"),
          ),
          Divider(
            color: Colors.grey,
          ),
          ListView(
            shrinkWrap: true,
            children:
              List.generate(settingList.length, (index) => ListTile(
                onTap: (){},
                title: Text(settingList[index]),
                leading: Icon(settingListIcon[index],
                color: Colors.blue,),


              ))

          )
        ],
      ),
    );
  }
}
