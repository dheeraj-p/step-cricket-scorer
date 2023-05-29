class BattingStats {
  int _runs = 0;
  int _sixes = 0;
  int _fours = 0;
  int _balls = 0;

  void addRuns(int runs) {
    _runs += runs;
  }

  void addBall() {
    _balls++;
  }

  @override
  String toString() {
    String result = '---------Batting Stats------\n';
    result += 'Runs scored: $_runs \n';
    result += 'Sixes: $_sixes \n';
    result += 'Fours: $_fours \n';
    result += 'Balls Played : $_balls\n';

    return result;
  }
}
