import 'package:flutter/material.dart';
import 'package:Foe/view/instructions_settings.dart';
/*import 'package:Foe/view/login.dart';
import 'package:Foe/signup.dart';*/
import 'package:Foe/animation/FadeAnimation.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  Column(children: <Widget>[
                    FadeAnimation(
                        1.2,
                        Text(
                          "¡Bienvenidos!",
                          style: TextStyle(
                              fontFamily: 'Lobster',
                              color: Colors.pink,
                              letterSpacing: .5,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(height: 40),
                    FadeAnimation(
                      1.4,
                      Text(
                          "Disfruta este juego entre amigos y pasa un tiempo adivinando palabras de la forma más divertida con",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    ),
                  ]),
                  SizedBox(height: 20),
                  FadeAnimation(
                      1.6,
                      Container(
                        height: MediaQuery.of(context).size.height / 2.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'))),
                      )),
                  Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.only(top: 3, left: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ElevatedButton(
                              child: Text('¡Empecemos!',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.black87,
                                      letterSpacing: .5,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InstructionsSettings()));
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  )),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      Size(double.infinity, 60)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.amber[600])),
                            ),
                          )),
                      SizedBox(height: 10)
                    ],
                  )
                ])),
      ),
    );
  }
}
