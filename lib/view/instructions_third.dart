import 'package:flutter/material.dart';
import 'package:Foe/animation/FadeAnimation.dart';
import 'package:flutter/rendering.dart';
import 'package:Foe/view/game.dart';
import 'package:Foe/backend/game.dart';

// ignore: must_be_immutable
class InstructionsThird extends StatelessWidget {
  Game game;

  InstructionsThird(Game game) {
    this.game = game;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
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
                "Ronda 3",
                style: TextStyle(
                    fontFamily: 'Lobster',
                    color: Colors.pink,
                    letterSpacing: .5,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              )),
          FadeAnimation(
              1.4,
              Text(" Descripción con mímica ",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      letterSpacing: .5,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))),
          SizedBox(height: 40),
          FadeAnimation(
            1.6,
            Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/mimica.png')))),
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
                              'El equipo debe adivinar la palabra en pantalla con la única ayuda de uno de sus compañeros, quien debe hacer ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'MÍMICA ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.pink,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'para ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'DESCRIBIRLA.',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.pink,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: ' Está ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'PROHIBIDO ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.pink,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'hacer cualquier tipo de sonido. ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
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
                    child: Text("Turno del ${game.currentTeam.nameTeam}",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black87,
                            letterSpacing: .5,
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ))),
        ],
      ))),
    );
  }
}
