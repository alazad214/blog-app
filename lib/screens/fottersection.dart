import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



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
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("my_social_data")
                .snapshots(),
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
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < data.length; i++)
                    InkWell(
                      onTap: () async {
                        final Uri url = Uri.parse(data[i]["link"]);
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: CircleAvatar(
                          child: Image.network(data[i]["icon"]),
                        ),
                      ),
                    )
                ],
              );
            }),
        const SizedBox(height: 20),
        const Text(
          "Keep up with the letest tech news on our social media",
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
