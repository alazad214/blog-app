import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Details_Desktop extends StatelessWidget {
  final Map<String, dynamic> blogItem;
  const Details_Desktop({super.key, required this.blogItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        titleSpacing: 0,
        title: Text(
          blogItem["title"],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    blogItem["image"],
                    height: 180,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Center(
                  child: Container(
                    color: Colors.lime,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person,
                          size: 18,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            blogItem["Auther"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.timer,
                          size: 18,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            blogItem["time"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Text(blogItem["dis"])),
                ElevatedButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(blogItem["source"].toString());
                    if (!await canLaunch(url.toString())) {
                      throw 'Could not launch $url';
                    }
                    await launch(url.toString());
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text("More.."),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
