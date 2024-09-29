import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("banner").snapshots(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data?.docs;
          return CarouselSlider.builder(
            itemCount: data?.length,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              height: 140,
            ),
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: data?[itemIndex]['image'],
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          );
        });
  }
}
