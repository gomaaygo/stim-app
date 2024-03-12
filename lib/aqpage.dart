// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'form-personal-data.dart';
import 'formfields.dart';

class AQPage extends StatelessWidget {
  const AQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30, left: 30, bottom: 30, top: 10),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset("assets/images/stim-logo2.png",
                width: 200, height: 200),
          ),
          Container(
            child: Row(
              children: [
                Container(
                    height: 40,
                    width: 165,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(255, 196, 0, 0.900),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4), // Cor da sombra
                          spreadRadius: 5, // Raio de propagação da sombra
                          blurRadius: 7, // Desfoque da sombra
                          offset: Offset(0, 3), // Offset da sombra
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'Passo 1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(
                              13,
                              71,
                              161,
                              0.900,
                            )),
                      ),
                    )),
                Container(
                  height: 40,
                  width: 165,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(255, 243, 0243, 0.900),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), // Cor da sombra
                        spreadRadius: 5, // Raio de propagação da sombra
                        blurRadius: 7, // Desfoque da sombra
                        offset: Offset(0, 3), // Offset da sombra
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Passo 2',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(
                            167,
                            157,
                            157,
                            0.900,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
          FormPersonalData(),
          Container(
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(13, 71, 161, 0.900),
                      minimumSize: Size(70, 65),
                      shape: CircleBorder()),
                  onPressed: () {},
                  child: Icon(Icons.navigate_next_outlined,
                      color: Colors.white, size: 40),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          )
        ],
      ),
    );
  }
}
