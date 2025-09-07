import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:Foe/animation/FadeAnimation.dart';
import 'package:Foe/view/statistics.dart';
import 'package:Foe/backend/game.dart';
import 'package:just_audio/just_audio.dart';

// ignore: must_be_immutable
class GamePage extends StatefulWidget {
  final Game game;

  const GamePage(this.game);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late AudioPlayer player;
  late CountDownController _controller;
  int _duration = 0;
  String _currentWord = '';

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    _controller = CountDownController();
    _duration = 0;
    _currentWord = widget.game.setWords.isNotEmpty ? widget.game.setWords[0] : '';
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _duration = widget.game.time;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FadeAnimation(
                  1.2,
                  CircularCountDownTimer(
                    duration: _duration,
                    initialDuration: 0,
                    controller: _controller,
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 3,
                    ringColor: Colors.grey[200],
                    ringGradient: null,
                    fillColor: Colors.amber,
                    fillGradient: null,
                    backgroundColor: Colors.white,
                    backgroundGradient: null,
                    strokeWidth: 20.0,
                    strokeCap: StrokeCap.round,
                    textStyle: TextStyle(
                        fontSize: 33.0,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold),
                    textFormat: CountdownTextFormat.S,
                    isReverse: true,
                    isReverseAnimation: true,
                    isTimerTextShown: true,
                    autoStart: true,
                    onStart: () {
//                      print(widget.game.setWords);
                    },
                    onComplete: () {
                      goNextPage(context, widget.game);
                    },
                  )),
              FadeAnimation(
                  1.4,
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: MediaQuery.of(context).size.height / 9,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Center(
                                child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text(
                                      "  $_currentWord  ",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.indigo[400],
                                          letterSpacing: 0.1,
                                          fontSize: 40,
                                          fontWeight: FontWeight.w700),
                                    )))),
                        Positioned(
                            top: -20,
                            right:
                                (MediaQuery.of(context).size.width / 1.2 / 2) -
                                    15,
                            child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.amber,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                width: 40,
                                height: 30,
                                child: Center(
                                    child: Text(
                                        '${widget.game.setWords.length}',
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)))))
                      ],
                    ),
                  )),
              SizedBox(height: 20),
              FadeAnimation(
                  1.6,
                  ElevatedButton.icon(
                      onPressed: () {
                        player.setAsset('assets/sounds/correct-sound.wav');
                        player.play();

                        switch (widget.game.round) {
                          /*
                          verificar que se sumen los puntos en la ronda correspondiente
                          */
                          case 1:
                            widget.game.currentTeam.roundOne++;
                            break;
                          case 2:
                            widget.game.currentTeam.roundTwo++;
                            break;
                          case 3:
                            widget.game.currentTeam.roundThree++;
                            break;
                        }
                        widget.game.removeWord(_currentWord);
                        setState(() {
                          if (widget.game.isNextWord()) {
                            _currentWord = widget.game.getCurrentWord();
                          } else {
                            goNextPage(context, widget.game);
                          }
                        });
                      },
                      icon: Icon(Icons.check, color: Colors.white, size: 60),
                      label: Text(""),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                            MediaQuery.of(context).size.width / 1.5,
                            MediaQuery.of(context).size.height / 9.5),
                        primary: Colors.greenAccent[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ))), //CHECK
              FadeAnimation(
                  1.8,
                  ElevatedButton.icon(
                      onPressed: () {
                        player.setAsset('assets/sounds/incorrect-sound.wav');
                        player.play();
                        if (_currentWord == widget.game.setWords.last) {
                          goNextPage(context, widget.game);
                        } else {
                          setState(() {
                            _currentWord = widget.game.getCurrentWord();
                            if (int.parse(_controller.getTime()) > 5) {
                              _duration = int.parse(_controller.getTime()) - 4;
                              _controller.restart(duration: _duration);
                            } else {
                              _controller.restart(duration: 0);
                            }
                          });
                        }
                      },
                      icon: Icon(Icons.clear, color: Colors.white, size: 50),
                      label: Text(""),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(
                            MediaQuery.of(context).size.width / 1.5,
                            MediaQuery.of(context).size.height / 9.5),
                        primary: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ))), //FAIL
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

void goNextPage(context, game) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => StatisticsPage(game)));
}
