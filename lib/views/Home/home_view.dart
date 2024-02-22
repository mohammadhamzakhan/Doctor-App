import 'package:doctor_app/consts/images.dart';
import 'package:doctor_app/res/components/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Welocme User",
          style: TextStyle(color: Colors.white, fontFamily: "Lobster"),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(13),
            color: Colors.blue,
            child: Row(children: [
              Expanded(
                child: CustomTextField(
                  hint: "Search Doctor",
                  borderColor: Colors.white,
                  enableColor: Colors.white,
                  textFieldColor: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              )
            ]),
          ),
          const Gap(20),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 8),
                    color: Colors.blue,
                    height: 70,
                    width: 70,
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.icBody,
                          width: 50,
                          color: Colors.white,
                        ),
                        const Gap(10),
                        Text(
                          "Body",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
