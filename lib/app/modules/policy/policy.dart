import 'package:flutter/material.dart';
import 'package:praner_blog/style/text_style.dart';
import 'package:praner_blog/utils/policy_utils.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Policy",
          style: AppTextStyle2(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Text(
              policy,
              style: AppTextStyle2(textColor: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
