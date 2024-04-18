import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

import '../utils/sliders_item.dart';

class Slider_Desktop extends StatelessWidget {
  const Slider_Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 980),
        child: Row(
          children: [
            Center(
              child: Card(
                color: Colors.white,
                child: Container(
                    height: 180,
                    width: 400,
                    clipBehavior: Clip.antiAlias,
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: AnotherCarousel(dotSize: 4, dotSpacing: 10, images: [
                      for (var i = 0; i < Slider_Image.length; i++)
                        Image(
                          image: AssetImage(Slider_Image[i]["image"]),
                          fit: BoxFit.cover,
                        )
                    ])),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All the tech lover customers will get all the information about the tech world through our website/app.",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
                    "All the tech lover customers will get all the information about the tech world through our website/app.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black38, fontSize: 14),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
