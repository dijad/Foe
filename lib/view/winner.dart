import 'package:flutter/material.dart';
import 'package:Foe/animation/FadeAnimation.dart';
import 'package:Foe/main.dart';
import 'package:Foe/backend/team.dart';
import 'package:just_audio/just_audio.dart';

// ignore: must_be_immutable
class WinnerPage extends StatelessWidget {
  Team winner;
  WinnerPage(Team team) {
    this.winner = team;
  }
  AudioPlayer player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    player.setAsset('assets/sounds/victory-sound.wav');
    player.play();
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeAnimation(
                    1.2,
                    Text(
                      "¡Ganador!",
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          color: Colors.pink,
                          letterSpacing: .5,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 60),
                FadeAnimation(
                    1.4,
                    Text(
                      "- ${winner.nameTeam} -",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black87,
                          letterSpacing: .5,
                          fontSize: 55,
                          fontWeight: FontWeight.w900),
                    )),
                FadeAnimation(
                    1.6,
                    Text(
                      "${winner.getTotalPoints()} puntos",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.black87,
                          letterSpacing: .5,
                          fontSize: 40,
                          fontWeight: FontWeight.w900),
                    )),
                SizedBox(height: 40),
                FadeAnimation(
                    1.8,
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/trophy.png'))),
                    )),
                SizedBox(height: 50),
                FadeAnimation(
                    2,
                    MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        player.stop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      color: Colors.amber[600],
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text("Inicio",
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black87,
                              letterSpacing: .5,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    )),
                SizedBox(height: 10)
              ],
            )));
  }
}
