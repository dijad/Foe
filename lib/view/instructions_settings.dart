import 'package:flutter/material.dart';
import 'package:Foe/animation/FadeAnimation.dart';
import 'package:flutter/rendering.dart';
import 'package:Foe/view/start.dart';

class InstructionsSettings extends StatelessWidget {
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
                "Configuraciones de \npartida",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Lobster',
                    color: Colors.pink,
                    letterSpacing: .5,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              )),
          SizedBox(height: 25),
          FadeAnimation(
              1.6,
              Container(
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/configuraciones-de-la-aplicacion.png'))),
              )),
          SizedBox(height: 25),
          FadeAnimation(
              1.8,
              Padding(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: '1) Número de equipos: ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.tealAccent[700],
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: 'Seleccionar el número entre 2 y 3.\n\n',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: '2) Número de palabras: ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.tealAccent[700],
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text:
                              'Seleccionar la cantidad de palabras para la partida entre 30 y 60. \n\n',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: '3) Tiempo de ronda: ',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.tealAccent[700],
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text:
                              'Elegir el tiempo de la ronda entre 30 y 60 segundos. \n\n',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: '¡Cada fallo restará 5 segundos! \n\n',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.red[700],
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700))
                    ])),
              )),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                    },
                    color: Colors.amber[600],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text("Ir a configuraciones",
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
