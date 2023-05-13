import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';
import 'package:cricket_scorer/src/core/models/toss_data.dart';

class TossEvent implements MatchEvent {
  final TossData _tossData;

  const TossEvent(this._tossData);

  @override
  get data => _tossData;

  @override
  EventType get type => EventType.toss;

  @override
  void apply(MatchSummary summary) {
    summary.addTossDetails(_tossData.winner, _tossData.decision);
  }
}