import 'dart:ffi';

import 'package:flutter/material.dart';
import 'appbar.dart';
import 'aqpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'STIM',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBarHome(),
          body: SingleChildScrollView(
            child: AQPage(),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0,
              fixedColor: Color.fromRGBO(104, 96, 96, 0.900),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, size: 30), label: 'Início'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.help,
                      size: 30,
                    ),
                    label: 'Ajuda'),
              ]),
        ));
  }
}
