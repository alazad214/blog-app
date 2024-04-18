import 'package:flutter/material.dart';

class Custom_AppBar extends StatelessWidget implements PreferredSizeWidget {
  const Custom_AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("custom appbar"),
      leading:
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
