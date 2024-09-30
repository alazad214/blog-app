import 'dart:math';

import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    super.key,
    this.text,
    this.iconSrc,
    this.onChanged,
    this.child,
    this.icon,
  });

  final String? text, iconSrc;

  final VoidCallback? onChanged;
  final Widget? child;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    Color randomColor =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.5);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: randomColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 0.1, color: Colors.black26)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15 / 3),
        leading: Image.asset('assets/icon/category.png', height: 20),
        title: Text(text ?? '',
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 18)),
      ),
    );
  }
}
