import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
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
    return Container(
      margin: const EdgeInsets.only(bottom: 1),
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(width: 0.1, color: Colors.black87)),
      child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 15 / 2),
          leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(4)),
            child: Icon(
              Icons.double_arrow,
              color: Colors.white,
            ),
          ),
          title: Text(
            text ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          trailing: Icon(Icons.arrow_right)),
    );
  }
}
