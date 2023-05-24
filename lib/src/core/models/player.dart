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

  String get name {
    return _name;
  }

  @override
  String toString() {
    return _name;
  }
}
