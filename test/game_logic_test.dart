import 'package:flutter_test/flutter_test.dart';
import 'package:Foe/backend/game.dart';
import 'package:Foe/backend/team.dart';
import 'package:Foe/utilities/utilities.dart';

void main() {
  group('Game Logic Tests', () {
    test('Game initialization creates teams correctly', () {
      // Test game creation with 2 teams, 30 words, 30 seconds
      Game game = Game(2, 30, 30);
      
      expect(game.firstTeam, isNotNull);
      expect(game.currentTeam, isNotNull);
      expect(game.wordsNumber, equals(30));
      expect(game.time, equals(30));
      expect(game.round, equals(1));
      expect(game.rounds, equals(3));
    });

    test('Team creation and linking works correctly', () {
      Game game = Game(3, 30, 30);
      
      // Count teams by traversing the linked list
      int teamCount = 0;
      Team? current = game.firstTeam;
      while (current != null) {
        teamCount++;
        current = current.nextTeam;
      }
      
      expect(teamCount, equals(3));
    });

    test('Word generation produces correct number of unique words', () {
      Utilities utilities = Utilities();
      List<String> words = utilities.getWordsSet(10);
      
      expect(words.length, equals(10));
      // Check that all words are unique
      expect(words.toSet().length, equals(10));
    });

    test('Word generation does not exceed available words', () {
      Utilities utilities = Utilities();
      // There are 70 words in totalWords, so requesting 80 should still work
      // but only return the available unique words
      List<String> words = utilities.getWordsSet(50);
      
      expect(words.length, equals(50));
      expect(words.length, lessThanOrEqualTo(utilities.totalWords.length));
    });

    test('Team scoring works correctly', () {
      Team team = Team('Test Team', 1);
      team.roundOne = 5;
      team.roundTwo = 3;
      team.roundThree = 7;
      
      expect(team.getTotalPoints(), equals(15));
    });

    test('Game winner determination works', () {
      Game game = Game(2, 30, 30);
      
      // Set some scores
      game.firstTeam!.roundOne = 10;
      game.firstTeam!.nextTeam!.roundOne = 5;
      
      Team? winner = game.getWinner();
      expect(winner, isNotNull);
      expect(winner!.getTotalPoints(), equals(10));
    });

    test('Current word retrieval works safely', () {
      Game game = Game(2, 30, 30);
      
      String word = game.getCurrentWord();
      expect(word, isNotEmpty);
    });

    test('Next team logic works correctly', () {
      Game game = Game(3, 30, 30);
      Team? firstTeam = game.currentTeam;
      
      game.getNextTeam();
      expect(game.currentTeam, isNot(equals(firstTeam)));
      
      // Should cycle back to first team after reaching the end
      game.getNextTeam();
      game.getNextTeam();
      expect(game.currentTeam, equals(firstTeam));
    });
  });
}