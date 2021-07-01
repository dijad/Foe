import 'dart:math';

class Utilities {
  var rand = new Random();
  List<String> totalWords = [
    'World Of Warcraft',
    'Cangrejo',
    'James Rodríguez',
    'Catapulta',
    'Tunja',
    'Los Simpsons',
    'Bender',
    'Kamehameha',
    'Krilin',
    'GTA',
    'Michael Jackson',
    'Mandarin',
    'Soñar',
    'Cristiano Ronaldo',
    'Ronaldinho',
    'Pinocho',
    'Bella durmiente',
    'Freddie Mercury',
    'Delicioso',
    'Twitter',
    'King Kong',
    'Justin Bieber',
    'Juegos de manos',
    'Par',
    'Opuesto',
    'Edgar Allan Poe',
    'Don Quijote de la Mancha',
    'Molino',
    'Shakira',
    'Titanic',
    'Parir',
    'Planear',
    'Investigar',
    'Tejer',
    'Unir',
    'Separ',
    'Argentina',
    'Secreto',
    'Controlar',
    'Pitágoras',
    'Simón Bolivar',
    'Adivinar',
    'Pastel',
    'Libro',
    'Doctor',
    'Beso',
    'Amigo',
    'Fiesta',
    'Vodka',
    'Dardos',
    'Compra',
    'Suegra',
    'Silencio',
    'Matrimonio',
    'Bebé',
    'Gatear',
    'Tortuga',
    'Bellaco',
    'Espanglish',
    'Carmen',
    'Anuel AA',
    'Pajarraco',
    'Pajaro loco',
    'Wea',
    'Presidente',
  ];
  List<String> set = [];

  getWordsSet(int numberWords) {
    int aux;
    while (set.length < numberWords) {
      aux = rand.nextInt(numberWords);
      String word = totalWords[aux];
      if (!isWord(word)) {
        set.add(word);
      }
    }
    return set;
  }

  isWord(String word) {
    for (int i = 0; i < set.length; i++) {
      if (set[i] == word) {
        return true;
      }
    }
    return false;
  }
}
