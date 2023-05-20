import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';

class MatchStartEvent implements MatchEvent {
  final String _teamAName;
  final String _teamBName;

  MatchStartEvent(this._teamAName, this._teamBName);

  @override
  void apply(MatchSummary summary) {
    summary.setTeams(_teamAName, _teamBName);
  }

  get data => [_teamAName, _teamBName];
  
  @override
  String toJSON() {
    throw UnimplementedError();
  }
}
