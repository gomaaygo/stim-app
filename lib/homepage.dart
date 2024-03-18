import 'package:appstim/aqpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, bottom: 120),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/images/stim-logo2.png",
                  width: 200, height: 200),
            ),
            Container(
                child: Text(
              'É uma ferramenta de autoavaliação que ajuda no processo de identificação de pessoas com autismo.',
              style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
              textAlign: TextAlign.center,
            )),
            Container(
              child: Image.asset("assets/images/img-play.jpeg",
                  width: 100, height: 100),
            ),
            Container(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFC400), minimumSize: Size(140, 45)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AQPage()),
                    );
                  },
                  child: Text(
                    'Iniciar',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat-ExtraBold',
                        color: Colors.white),
                  )),
              padding: EdgeInsets.all(15),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
    );
  }
}
