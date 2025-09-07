import 'package:flutter/material.dart';
import 'package:Foe/animation/FadeAnimation.dart';
import 'package:Foe/view/instructions_first.dart';
import 'package:Foe/backend/game.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Game? _game;
  int _numTeams = 2, _numWords = 30, _roundTime = 30, _currentValue = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.pink,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.white)),
        ),
        body: Center(
            child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: Colors.pink,
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: <
                        Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FadeAnimation(
                            1.2,
                            Text(
                              "Configuraciones de \npartida",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Lobster',
                                  color: Colors.white,
                                  letterSpacing: .5,
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold),
                            )),
                      ]),
                  SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height - 170,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(100))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FadeAnimation(
                              1.6,
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 8.5,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/slide.gif'))),
                              )),
                          SizedBox(height: 10),
                          FadeAnimation(
                            1.5,
                            makeInputNumber(
                                label: "Número de equipos",
                                typeInput: 'EQUIPOS',
                                widthIn: MediaQuery.of(context).size.width,
                                initialNum: 2,
                                maxLimit: 3,
                                minLimit: 2,
                                icon: Icons.group,
                                step: 1),
                          ),
                          FadeAnimation(
                              1.5,
                              Divider(
                                height: 50,
                                thickness: 1.5,
                                indent: 30,
                                endIndent: 30,
                              )),
                          FadeAnimation(
                              1.5,
                              makeInputNumber(
                                  label: "Cantidad de palabras",
                                  typeInput: 'PALABRAS',
                                  widthIn: MediaQuery.of(context).size.width,
                                  initialNum: 30,
                                  maxLimit: 60,
                                  minLimit: 30,
                                  icon: Icons.add,
                                  step: 10)),
                          FadeAnimation(
                              1.5,
                              Divider(
                                height: 50,
                                thickness: 1.5,
                                indent: 30,
                                endIndent: 30,
                              )),
                          FadeAnimation(
                              1.5,
                              makeInputNumber(
                                  label: "Tiempo por ronda",
                                  typeInput: 'TIEMPO',
                                  widthIn: MediaQuery.of(context).size.width,
                                  initialNum: 30,
                                  maxLimit: 60,
                                  minLimit: 30,
                                  icon: Icons.timer,
                                  step: 10)),
                          //SizedBox(height: 50),
                          FadeAnimation(
                              1.6,
                              MaterialButton(
                                minWidth:
                                    MediaQuery.of(context).size.width / 1.15,
                                height: 60,
                                onPressed: () {
                                  _game = new Game(
                                      _numTeams, _numWords, _roundTime);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InstructionsFirst(_game)));
                                },
                                color: Colors.amber[600],
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: Text("Instrucciones",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                        color: Colors.grey[850])),
                              )),
                          SizedBox(height: 20)
                        ],
                      )),
                ]))));
  }

  Widget makeInputNumber(
      {label,
      typeInput,
      obscureText = false,
      context,
      widthIn,
      initialNum,
      maxLimit,
      minLimit,
      icon,
      step}) {
    switch (typeInput) {
      case 'EQUIPOS':
        {
          _currentValue = _numTeams;
        }
        break;
      case 'PALABRAS':
        {
          _currentValue = _numWords;
        }
        break;
      case 'TIEMPO':
        {
          _currentValue = _roundTime;
        }
        break;
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(icon),
                      SizedBox(width: 15),
                      Text(label,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    ]),
                SizedBox(width: 20),
                NumberPicker(
                  itemWidth: 70,
                  selectedTextStyle: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.pink,
                      letterSpacing: .5,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                  textStyle: TextStyle(
                      fontFamily: 'Roboto',
                      color: Colors.black,
                      letterSpacing: .5,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                  value: _currentValue,
                  minValue: minLimit,
                  maxValue: maxLimit,
                  step: step,
                  haptics: true,
                  axis: Axis.horizontal,
                  onChanged: (value) {
                    setState(() {
                      _currentValue = value;
                      switch (typeInput) {
                        case 'EQUIPOS':
                          {
                            _numTeams = value;
                          }
                          break;
                        case 'PALABRAS':
                          {
                            _numWords = value;
                          }
                          break;
                        case 'TIEMPO':
                          {
                            _roundTime = value;
                          }
                          break;
                      }
                    });
                  },
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
          SizedBox(height: 5),
        ]);
  }
}
