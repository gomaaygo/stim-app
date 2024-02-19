import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset("assets/images/qc-autism.png", width: 40, height: 40),
      backgroundColor: const Color.fromRGBO(167, 157, 157, 0.100),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.menu, size: 35),
          onPressed: () {},
        )
      ],
    );
  }
}
