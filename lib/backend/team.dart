class Team {
  Team(String nameTeam, int number) {
    this.nameTeam = nameTeam;
    this.numberTeam = number;
  }
  String nameTeam;
  int roundOne = 0;
  int roundTwo = 0;
  int roundThree = 0;
  Team nextTeam;
  int numberTeam;

  setNextTeam(Team nextTeam) {
    this.nextTeam = nextTeam;
  }

  getTotalPoints() {
    return roundOne + roundTwo + roundThree;
  }
}
