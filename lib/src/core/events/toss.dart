import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';
import 'package:cricket_scorer/src/core/models/toss_data.dart';

class TossEvent implements MatchEvent {
  final TossData _tossData;

  const TossEvent(this._tossData);

  TeamOrder _oppositeOf(TeamOrder teamOrder) {
    return teamOrder == TeamOrder.team1 ? TeamOrder.team2 : teamOrder;
  }

  bool _isWinnerFielding() {
    return _tossData.decision == TossDecision.batting;
  }

  @override
  void apply(MatchSummary summary) {
    summary.addTossDetails(_tossData.winner, _tossData.decision);
    
    final teams = summary.teams;

    Team battingTeam = teams[_tossData.winner]!;
    Team bowlingTeam = teams[_oppositeOf(_tossData.winner)]!;

    if (_isWinnerFielding()) {
      bowlingTeam = teams[_tossData.winner]!;
      battingTeam = teams[_oppositeOf(_tossData.winner)]!;
    }

    summary.setBattingTeam(battingTeam);
    summary.setBowlingTeam(bowlingTeam);
  }

  @override
  String toJSON() {
    throw UnimplementedError();
  }
}
