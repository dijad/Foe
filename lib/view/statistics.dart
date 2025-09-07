import 'package:flutter/material.dart';
import 'package:Foe/animation/FadeAnimation.dart';
import 'package:Foe/view/game.dart';
import 'package:Foe/view/instructions_second.dart';
import 'package:Foe/view/instructions_third.dart';
import 'package:Foe/view/winner.dart';
import 'package:Foe/backend/game.dart';
import 'package:Foe/backend/team.dart';

// ignore: must_be_immutable
class StatisticsPage extends StatefulWidget {
  final Game game;

  const StatisticsPage(this.game);
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late Game game;
  String textButton = '';
  @override
  void initState() {
    super.initState();
    game = widget.game;
    textButton = getTextButton();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          FadeAnimation(
              1.2,
              Text("Ronda ${game.round}",
                  style: TextStyle(
                      fontFamily: 'Lobster',
                      color: Colors.pink,
                      letterSpacing: 0.1,
                      fontSize: 50,
                      fontWeight: FontWeight.bold))),
          FadeAnimation(
              1.4,
              Text("Ronda de descripción terminada",
                  style: TextStyle(
                      fontFamily: 'Roboto', fontWeight: FontWeight.w700))),
          SizedBox(height: 25),
          FadeAnimation(
              1.6,
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Colors.white.withOpacity(0.05)],
                    stops: [0.98, 1],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: ListView(
                        children: creatTablesStats(
                            game.firstTeam, MediaQuery.of(context).size))),
              )),
          SizedBox(height: 25),
          FadeAnimation(
              1.8,
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 1.5,
                height: 60,
                onPressed: () {
                  goNextPage(context);
                },
                color: Colors.amber[600],
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(this.textButton,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.grey[850])),
              )),
        ],
      ))),
    );
  }

  goNextPage(context) {
    game.getNextTeam();
    if (game.round < game.rounds && game.setWords.length > 0 ||
        game.round == game.rounds && game.setWords.length > 0) {
      //Si no se ha acabado la partida
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => GamePage(game)));
    } else if (game.round == game.rounds && game.setWords.length == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WinnerPage(game.getWinner())));
    } else if (game.setWords.length == 0) {
      switch (game.round) {
        case 1:
          game.currentTeam = game.currentTeam.nextTeam;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InstructionsSecond(game)));
          game.round++;
          break;
        case 2:
          if (game.currentTeam.nextTeam.nextTeam == null) {
            //si no hay un tercer equipo
            game.currentTeam = game.firstTeam;
          } else {
            game.currentTeam = game.currentTeam.nextTeam.nextTeam;
          }
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InstructionsThird(game)));
          game.round++;
          break;
      }
    }
  }

  String getTextButton() {
    if (game.round == game.rounds && game.setWords.length == 0) {
      return '¡Ver Ganador!';
    } else if (game.setWords.length > 0) {
      return 'Turno ${game.getNextTeamSimple().nameTeam}';
    } else {
      return '¡Siguiente Ronda!';
    }
  }

  Widget makeTableTeam({widhtTable, team}) {
    List<Color> _colors = [Colors.amber, Colors.red, Colors.pink, Colors.blue];
    return Column(children: <Widget>[
      SizedBox(height: 10),
      Container(
          width: widhtTable.width / 1.1,
          decoration: BoxDecoration(
              color: _colors[team.numberTeam - 1],
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
          child: Center(
              child: Column(children: <Widget>[
            SizedBox(height: 8),
            Text(team.nameTeam,
                style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    letterSpacing: .5,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
                width: widhtTable.width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.all(Radius.circular(9.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Round 1",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text('${team.roundOne}',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            SizedBox(height: 5),
            Container(
                width: widhtTable.width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(9.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Round 2",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black54,
                            letterSpacing: .5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text('${team.roundTwo}',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black54,
                            letterSpacing: .5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            SizedBox(height: 5),
            Container(
                width: widhtTable.width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.all(Radius.circular(9.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Round 3",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text('${team.roundThree}',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            SizedBox(height: 5),
            Container(
                width: widhtTable.width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(9.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    /*
                    Text("Round 4",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.black54,
                                letterSpacing: .5,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                    Text("-",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.black54,
                                letterSpacing: .5,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))),
                                */
                  ],
                )),
            SizedBox(height: 5),
            Container(
                width: widhtTable.width / 1.2,
                decoration: BoxDecoration(
                  color: _colors[team.numberTeam - 1],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Total",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text(
                        (team.roundOne + team.roundTwo + team.roundThree)
                            .toString(),
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            SizedBox(height: 5),
          ])))
    ]);
  }

  List<Widget> creatTablesStats(Team? firstTeam, widhtTable) {
    final list = <Widget>[];
    Team? aux = firstTeam;
    while (aux != null) {
      list.add(makeTableTeam(widhtTable: widhtTable, team: aux));
      aux = aux.nextTeam;
    }
    list.add(SizedBox(height: 10));
    return list;
  }
}
