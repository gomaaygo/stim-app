// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'dart:ffi' as ffi;
import 'dart:ui' as ui;

import 'package:appstim/homepage.dart';
import 'package:flutter/material.dart';
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
    'Qual a idade do paciente (meses)?',
    'Selecione o gênero:',
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
  Map<String, dynamic> aqDict = {};
  String selectedOption = 'a';
  final TextEditingController _controller = TextEditingController();
  String _selectedGender = 'f';

  void submitAQ(String rating) {
    setState(() {
      aqDict['aq$currentQuestion'] = rating;
      if (currentQuestion < 9) {
        currentQuestion++;
        print("Feedback submitAQ: $aqDict");
      } else {
        print("Feedback submitAQ: $aqDict");

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
      'feedback': aqDict,
    };

    final file = File('aq_data.json');
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
                      color: currentQuestion <= 1
                          ? Color.fromRGBO(255, 196, 0, 0.900)
                          : Color.fromRGBO(255, 243, 0243, 0.900),
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
                            color: currentQuestion <= 1
                                ? Color.fromRGBO(255, 243, 0243, 0.900)
                                : Color.fromRGBO(
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
                    color: currentQuestion <= 1
                        ? Color.fromRGBO(255, 243, 0243, 0.900)
                        : Color.fromRGBO(255, 196, 0, 0.900),
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
                          color: currentQuestion <= 1
                              ? Color.fromRGBO(
                                  13,
                                  71,
                                  161,
                                  0.900,
                                )
                              : Color.fromRGBO(255, 243, 0243, 0.900)),
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
                  if (currentQuestion == 0)
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        key: Key('age'),
                        keyboardType: TextInputType.number,
                        controller: _controller,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            hintStyle: TextStyle(
                                fontFamily: 'Montserrat-Medium', fontSize: 16)),
                      ),
                    ),
                  if (currentQuestion == 1)
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      child: DropdownButtonFormField<String>(
                        value: null,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedGender = newValue as String ?? '';
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            hintStyle: TextStyle(
                                fontFamily: 'Montserrat', fontSize: 16),
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat', fontSize: 16)),
                      ),
                    ),
                  if (currentQuestion > 1)
                    Stack(
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150,
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text('Sempre',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 13)),
                                    value: 'a',
                                    groupValue: selectedOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text('Habitualmente',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 13)),
                                    value: 'b',
                                    groupValue: selectedOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 150,
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text('Raramente',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 13)),
                                    value: 'd',
                                    groupValue: selectedOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  child: RadioListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                      'Nunca',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 13),
                                      textAlign: TextAlign.left,
                                    ),
                                    value: 'e',
                                    groupValue: selectedOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedOption = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 115),
                              width: 150,
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text('Às vezes',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 13)),
                                value: 'c',
                                groupValue: selectedOption,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedOption = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
                  onPressed: () {
                    if (currentQuestion == 0)
                      selectedOption = _controller.text;
                    else if (currentQuestion == 1)
                      selectedOption = _selectedGender == 'Feminino' ? 'f' : 'm';

                    submitAQ(selectedOption);
                    selectedOption = '';
                  },
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
