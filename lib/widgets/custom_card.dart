import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app/modules/details blog/details_mobile.dart';
import '../utils/blog_item.dart';

class CustomCard extends StatelessWidget {
  CustomCard({super.key});
  final controller = Get.put(BlogController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("cards").snapshots(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Center(
                child: CircularProgressIndicator(
              color: Colors.lime,
            ));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text("No data"),
            );
          }

          final data = snapshot.data!.docs;
          return Wrap(
            runSpacing: 20,
            spacing: 20,
            children: [
              for (int i = 0; i < data.length; i++)
                InkWell(
                  onTap: () {
                    Get.to(DetailsMobile(product: data[i]));
                  },
                  child: Container(
                    height: 240,
                    width: 300,
                    clipBehavior: Clip.antiAlias,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CachedNetworkImage(
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          imageUrl: data[i]["image"],
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 5),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.timer,
                                size: 18,
                                color: Colors.white60,
                              ),
                              const Expanded(
                                child: Text(
                                  "03:50 PM", // Update with your actual time data
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Icon(
                                Icons.person,
                                size: 18,
                                color: Colors.white60,
                              ),
                              Expanded(
                                child: Text(
                                  data[i]["auther"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white60,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            data[i]["title"],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )
            ],
          );
        });
  }
}
