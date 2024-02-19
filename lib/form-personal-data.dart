// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
            Container(
              padding: EdgeInsets.only(top: 40, bottom: 10),
              child: Text(
                '1. Qual a idade do paciente (meses)?',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
              ),
            ),
            Container(
              padding: EdgeInsets.only( bottom: 10),
              child: TextFormField(
                key: Key('age'),
                decoration: InputDecoration(
                    labelText: '',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                    hintStyle:
                        TextStyle(fontFamily: 'Montserrat-Medium', fontSize: 16)),
              ),
            ),
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
