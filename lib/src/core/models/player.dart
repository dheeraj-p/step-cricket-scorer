import 'package:cricket_scorer/src/core/models/batting_stats.dart';
import 'package:cricket_scorer/src/core/models/bowling_stats.dart';

class Player {
  final String _name;
  BattingStats _battingStats;
  BowlingStats _bowlingStats;

  Player(this._name, this._battingStats, this._bowlingStats);

  Player.from(String name)
      : _name = name,
        _battingStats = BattingStats(),
        _bowlingStats = BowlingStats();

  void score(int runs) {
    _battingStats.addRuns(runs);
    addBallToBattingStats();
  }

  void concede(int runs) {
    _bowlingStats.addRuns(runs);
  }

  void addBallToBowlingStats() {
    _bowlingStats.addBall();
  }

  void addBallToBattingStats() {
    _battingStats.addBall();
  }

  String get name {
    return _name;
  }

  @override
  String toString() {
    String result = "---> $_name's Stats <--- \n";
    result += _battingStats.toString();
    result += _bowlingStats.toString();

    return result;
  }
}
