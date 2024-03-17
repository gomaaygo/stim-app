// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:appstim/homepage.dart';
import 'package:flutter/material.dart';
import 'form-personal-data.dart';
import 'formfields.dart';
import 'appbar.dart';
import 'dart:convert';
import 'dart:io';

class AQ10Screen extends StatefulWidget {
  @override
  _AQ10ScreenState createState() => _AQ10ScreenState();
}

class _AQ10ScreenState extends State<AQ10Screen> {
  int currentQuestion = 0;
  List<String> questions = [
    'A sua criança olha	para si	quando chama pelo	nome dela?',
    'Quão fácil	é	para si conseguir	contato	ocular com a sua criança?',
    'A sua criança aponta	para indicar que quer alguma coisa? (ex: um	brinquedo	que	está fora	do alcance)',
    'A sua criança aponta	para partilhar um	interesse	consigo? (ex: apontar	para um	cenário interessante)',
    'A sua criança “faz	de conta”? (ex: ao cuidar	de bonecas, falar	num	telefone de	brincar)',
    'A	sua	criança	segue	o	seu olhar?',
    'Se	você ou	alguém da	sua	família	estiver visivelmente aborrecido, a sua criança mostra	sinais de	querer confortá-lo?	(ex: acariciando o cabelo, abraçando)',
    'Descreveria as	primeiras	palavras da	sua	criança	como:',
    'A sua criança usa gestos simples? (ex: acenar adeus)',
    'A sua criança olha	fixamente	para nada sem	razão aparente?'
  ];
  List<int> feedbackList = List.filled(10, 0);

  void submitFeedback(int rating) {
    setState(() {
      feedbackList[currentQuestion] = rating;
      if (currentQuestion < 9) {
        currentQuestion++;
      } else {
        print("Feedback submitted: $feedbackList");

        // Após responder à última pergunta, navega para a página inicial.
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  Future<void> saveFeedbackToJson() async {
    Map<String, dynamic> feedbackData = {
      'questions': questions,
      'feedback': feedbackList,
    };

    final file = File('feedback_data.json');
    await file.writeAsString(jsonEncode(feedbackData));
  }

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
          Container(
            child: Form(
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20, bottom: 10, left: 3, right: 3),
                    child: Text(
                      '${currentQuestion + 1}. ${questions[currentQuestion]}',
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 18),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  RadioOptions(),
                  Container(
                    child: Text(
                      '${currentQuestion + 1}/12',
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 15),
                    ),
                  ), // Adiciona espaço de 20 unidades entre os widgets
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(13, 71, 161, 0.900),
                      minimumSize: Size(70, 65),
                      shape: CircleBorder()),
                  onPressed: () => submitFeedback(currentQuestion + 1),
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

class AQPage extends StatelessWidget {
  const AQPage({super.key});

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
            child: AQ10Screen(),
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
        ),
        debugShowCheckedModeBanner: false);
  }
}
