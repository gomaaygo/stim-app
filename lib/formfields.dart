import 'dart:ffi';

import 'package:flutter/material.dart';

class InputAge extends StatelessWidget {
  const InputAge({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 10),
          child: Text(
            '1. Qual a idade do paciente (meses)?',
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: TextFormField(
            key: Key('age'),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                hintStyle:
                    TextStyle(fontFamily: 'Montserrat-Medium', fontSize: 16)),
          ),
        ),
      ],
    );
  }
}

class GenderSelectionDropdown extends StatefulWidget {
  @override
  _GenderSelectionDropdownState createState() =>
      _GenderSelectionDropdownState();
}

class _GenderSelectionDropdownState extends State<GenderSelectionDropdown> {
  String _selectedGender = 'f';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 10, left: 5),
          alignment: Alignment.topLeft,
          child: Text(
            '2. Selecione o gênero:',
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 17),
          ),
        ),
        DropdownButtonFormField<String>(
          value: null,
          onChanged: (newValue) {
            setState(() {
              _selectedGender = newValue ?? '';
            });
          },
          items: <String>['Masculino', 'Feminino']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              hintStyle:
                  TextStyle(fontFamily: 'Montserrat', fontSize: 16),
              labelStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 16)),
        )
      ],
    );
  }
}
