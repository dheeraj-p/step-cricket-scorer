class BowlingStats {
  int _ballsBowled = 0;
  int _wickets = 0;
  int _runsConceded = 0;
  int _extras = 0;

  addRuns(int runs) {
    _runsConceded += runs;
  }

  addBall() {
    _ballsBowled++;
  }

  @override
  String toString() {
    String result = '---------Bowling Stats------\n';
    result += 'Balls Bowled: $_ballsBowled \n';
    result += 'Wickets: $_wickets \n';
    result += 'Runs Conceded: $_runsConceded \n';
    result += 'Extras : $_extras\n';

    return result;
  }
}
