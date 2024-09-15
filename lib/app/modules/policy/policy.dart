import 'package:flutter/material.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Policy"),
        backgroundColor: Colors.blueGrey,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [Text("আমরা ব্লগ রাইডার (Blog Rider) অ্যাপটি তৈরি করেছি আপনার ব্লগ পোস্ট পড়া, লেখা এবং সার্ভে করার জন্য। আপনার গোপনীয়তা আমাদের জন্য গুরুত্বপূর্ণ এবং আমরা এই গোপনীয়তা নীতির মাধ্যমে আপনার ব্যক্তিগত তথ্য কীভাবে সংরক্ষণ করে এবং ব্যবহার করি তা স্পষ্টভাবে প্রদর্শন করতে চাই।"
              "\n"
              "আমরা আপনার ব্লগ পোস্ট পড়া, লেখা এবং সার্ভারে সংরক্ষণ করা তথ্যগুলি ব্যবহার করি আমাদের সার্ভিস পরিষেবা উন্নত করার জন্য এবং অ্যাপ্লিকেশনের পারফর্মেন্স উন্নত করার জন্য।")],
        ),
      ),
    );
  }
}
