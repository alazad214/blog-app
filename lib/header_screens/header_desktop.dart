import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praner_blog/screens/search_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Header_Desktop extends StatelessWidget {
  const Header_Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => Search_Screen());
              },
              child: Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blueGrey)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [Icon(Icons.search), Text("Search")],
                  ),
                ),
              ),
            ),
            const Text(
              "Blog Rider",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            CircleAvatar(
              backgroundColor: Colors.black12,
              child: IconButton(
                  onPressed: () async {
                    final Uri url =
                        Uri.parse("https://www.facebook.com/alazad214");
                    if (!await canLaunch(url.toString())) {
                      throw 'Could not launch $url';
                    }
                    await launch(url.toString());
                  },
                  icon: const Icon(Icons.facebook)),
            )
          ],
        ),
      ),
    );
  }
}
