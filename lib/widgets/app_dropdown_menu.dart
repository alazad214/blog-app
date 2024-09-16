import 'package:flutter/material.dart';

class AppDropdownMenu extends StatelessWidget {
  final value;
  final String? hintText;
  final Icon? icon;
  final List<DropdownMenuItem>? items;
  final onChanged;

  const AppDropdownMenu({
    Key? key,
    this.value,
    this.hintText,
    this.icon,
    this.items,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      hint: Text(hintText ?? ""),
      icon: icon ?? Icon(Icons.arrow_drop_down),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.black12, width: 0.1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black12, width: 0.1),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      items: items,
      onChanged: onChanged,
    );
  }
}
