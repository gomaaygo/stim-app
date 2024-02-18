import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, bottom: 70),
        child: Column(
          children: [
            Container(
              child: Image.asset("assets/images/stim-logo2.jpeg",
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
                  onPressed: () {},
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
