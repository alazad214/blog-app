import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/sliders_item.dart';

class Slider_Mobile extends StatelessWidget {
  const Slider_Mobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        child: Container(
            height: 180,
            width: 400,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: AnotherCarousel(dotSize: 4, dotSpacing: 10, images: [
              for (var i = 0; i < Slider_Image.length; i++)
                Image(
                  image: AssetImage(Slider_Image[i]["image"]),
                  fit: BoxFit.cover,
                )
            ])),
      ),
    );
  }
}
