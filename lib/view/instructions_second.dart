import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Foe/animation/FadeAnimation.dart';
import 'package:flutter/rendering.dart';
import 'package:Foe/backend/game.dart';
import 'package:Foe/view/game.dart';

// ignore: must_be_immutable
class InstructionsSecond extends StatelessWidget {
  final Game game;

  InstructionsSecond(this.game);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.pink,
        title: Text("Instrucciones"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white)),
      ),
      body: Container(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FadeAnimation(
              1.2,
              Text(
                "Ronda 2",
                style: TextStyle(
                    fontFamily: 'Lobster',
                    color: Colors.pink,
                    letterSpacing: .5,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              )),
          FadeAnimation(
              1.4,
              Text(" Descripción con UNA palabra ",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      letterSpacing: .5,
                      fontSize: 18,
                      fontWeight: FontWeight.w700))),
          SizedBox(height: 40),
          FadeAnimation(
            1.6,
            Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/burbuja-de-dialogo.png')))),
          ),
          SizedBox(height: 40),
          FadeAnimation(
              1.8,
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text:
                              'El equipo debe adivinar la palabra en pantalla con la única ayuda de uno de sus compañeros de equipo, quien debe ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'DESCRIBIRLA ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.pink,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'con ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'UNA SOLA PALABRA ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.pink,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'evitando usar palabras ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'SIMILARES ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.pink,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'o ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'TRADUCCIONES.',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.pink,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    ])),
              )),
          SizedBox(height: 50),
          FadeAnimation(
              2,
              Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width / 1.18,
                    height: 60,
                    onPressed: () {
                      game.resetWords();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GamePage(game)));
                    },
                    color: Colors.amber[600],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text("Turno del equipo 2",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            letterSpacing: .5,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ))),
        ],
      ))),
    );
  }
}
