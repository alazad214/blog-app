import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/contact_item.dart';

class Fotter_Section extends StatelessWidget {
  const Fotter_Section({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const Text(
          "Stay Connected",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < contactImage.length; i++)
              InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(urlContact[i]["url"]);
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    child: Image.asset(contactImage[i]["img"].toString()),
                  ),
                ),
              )
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          "Keep up with the letest tech news on our social media",
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        const Divider(),
      ],
    );
  }
}
