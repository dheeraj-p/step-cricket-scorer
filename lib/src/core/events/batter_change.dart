import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';
import 'package:cricket_scorer/src/core/models/batting_stats.dart';
import 'package:cricket_scorer/src/core/models/bowling_stats.dart';
import 'package:cricket_scorer/src/core/models/player.dart';

class BatterChangeEvent implements MatchEvent {
  final String name;
  final BatterEnd batterEnd;

  const BatterChangeEvent(this.name, this.batterEnd);

  bool _isStriker() {
    return batterEnd == BatterEnd.striker;
  }

  @override
  void apply(MatchSummary currentState) {
    Player batter = Player(name, BattingStats(), BowlingStats());
    if (_isStriker()) {
      currentState.setStriker(batter);
      return;
    }

    currentState.setNonStriker(batter);
  }

  @override
  String toJSON() {
    throw UnimplementedError();
  }
}
