import 'package:Foe/backend/team.dart';
import 'package:Foe/utilities/utilities.dart';

class Game {
  Utilities utilities;
  List<String> setWords = []; // stt de palabras para la ronda
  List<String> setWordsGame = []; // stt de palabras para la partida
  String currentWord;
  Team firstTeam; //head
  Team currentTeam;
  int wordsNumber;
  int time;
  int counterWords;
  int round;
  int rounds;

  Game(int teamsNumber, int wordsNumber, int time) {
    this.utilities = new Utilities();
    this.time = time;
    this.wordsNumber = wordsNumber;
    this.counterWords = 1;
    this.round = 1;
    this.rounds = 3;
    this.setGameWords();
    for (int i = 0; i < teamsNumber; i++) {
      addTeam(new Team('Equipo  ${i + 1}', (i + 1)));
    }
    this.currentWord = setWords[0];
  }

  Team getWinner() {
    List<Team> teams = [];
    Team aux = firstTeam;
    while (aux != null) {
      teams.add(aux);
      aux = aux.nextTeam;
    }
    Team max = teams[0];
    for (int i = 1; i < teams.length; i++) {
      if (teams[i].getTotalPoints() > max.getTotalPoints()) {
        max = teams[i];
      }
    }
    return max;
  }

  addTeam(Team team) {
    //agregar equipo a la lista simple enlazada
    if (firstTeam == null) {
      firstTeam = team;
      currentTeam = firstTeam;
    } else {
      Team aux = firstTeam;
      while (aux.nextTeam != null) {
        aux = aux.nextTeam;
      }
      aux.nextTeam = team;
    }
  }

  setNextCurrentTeam() {
    //colocar el siguiente equipo en jugar
    currentTeam = currentTeam.nextTeam;
  }

  setGameWords() {
    // obtiene el set de palabras para la partida con base en el numero de plaabras elegido para la misma
    this.setWords = utilities.getWordsSet(wordsNumber);
  }

  getCurrentWord() {
    //obtiene la palabra actual en juego y aumenta el indice para buscar la siguiente palabra
    String word = setWords[counterWords];
    counterWords++;
    return word;
  }

  getNextRound() {
    // siguiente ronda de juego
    this.round++;
  }

  removeWord(String word) {
    this.setWords.remove(word);
    this.setWordsGame.add(word);
    if (counterWords != 0) {
      counterWords--;
    }
  }

  isNextWord() {
    return this.counterWords < this.setWords.length ? true : false;
  }

  isNextTeam() {
    return currentTeam.nextTeam != null ? true : false;
  }

  getNextTeam() {
    counterWords = 0;
    if (!isNextTeam() && setWords.length > 0 || setWords.length == 0) {
      //si se llego al final de la lista y aun hay palabras, empieza de nuevo la lista
      currentTeam = firstTeam;
    } else if (setWords.length > 0) {
      currentTeam = currentTeam.nextTeam;
    }
  }

  getNextTeamSimple() {
    return currentTeam.nextTeam == null ? firstTeam : currentTeam.nextTeam;
  }

  resetWords() {
    setWords = setWordsGame;
    setWordsGame = [];
  }
}
