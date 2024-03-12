// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'formfields.dart';

class FormPersonalData extends StatelessWidget implements PreferredSizeWidget {
  const FormPersonalData({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10, left: 3, right: 3),
              child: Text(
                '1. A	sua	criança	olha	para	si	quando	chama	pelo	nome	dela?',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 18),
              ),
            ),
            RadioOptions(),
            Container(
              child: Text(
                '1/10',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
              ),
            ), // Adiciona espaço de 20 unidades entre os widgets
          ],
        ),
      ),
    );
  }
}
