import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../consts/images.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Category Details",style: TextStyle(
            color: Colors.white
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              mainAxisExtent: 170,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8
            ),
            itemCount: 10,
            itemBuilder: (context, index){
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(

                      width: 130,
                      height: 120,
                      color: Colors.grey.shade500,
                      child: Image.asset(
                        fit: BoxFit.fill,
                        AppAssets.signUp,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      'Doctor',
                      style: TextStyle(),
                    ),
                    VxRating(onRatingUpdate: (value) {},
                      selectionColor: Colors.yellow,
                      normalColor: Colors.black45,
                      count: 5,
                      maxRating: 5,
                      value: 4,
                      stepInt: true,
                    ),

                  ],
                ),
              );
            }
        ),
      ),
    );
  }
}
