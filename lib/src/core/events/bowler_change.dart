import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';
import 'package:cricket_scorer/src/core/models/batting_stats.dart';
import 'package:cricket_scorer/src/core/models/bowling_stats.dart';
import 'package:cricket_scorer/src/core/models/player.dart';

class BowlerChangeEvent implements MatchEvent {
  final String _name;

  const BowlerChangeEvent(this._name);

  @override
  void apply(MatchSummary currentState) {
    currentState.setBowler(_name);
  }

  @override
  String toJSON() {
    throw UnimplementedError();
  }
}
