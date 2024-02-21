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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GenderSelectionDropdown(),
            Container(
              child: Text(
                '1/5',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
              ),
            ), // Adiciona espaço de 20 unidades entre os widgets
          ],
        ),
      ),
    );
  }
}
