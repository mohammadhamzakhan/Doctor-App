import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../consts/images.dart';
import '../login_view_doctor/login_view_doctor.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;

  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    String queryLowerCase = searchQuery.toLowerCase();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search Results",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Lobster",
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('doctors').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data?.docs.where((doc) {
              String name = doc['docName'].toString().toLowerCase();
              String category = doc['docCategory'].toString().toLowerCase();
              return name.contains(queryLowerCase) ||
                  category.contains(queryLowerCase);
            }).toList();

            if (data == null || data.isEmpty) {
              return const Center(
                child: Text(
                  "No results found",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 40,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var doc = data[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => LoginViewDoctor(doc: doc));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15)),
                            child: Container(
                              width: double.infinity,
                              height: 170,
                              color: Colors.grey.shade300,
                              child: Image.asset(
                                AppAssets.signUp,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doc['docName'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Gap(5),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow, size: 16),
                                    const Gap(5),
                                    Text(
                                      doc['docRating'].toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
