import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';

class SetOversEvent implements MatchEvent {
  final int _overs;

  SetOversEvent(this._overs);

  @override
  void apply(MatchSummary currentState) {
    currentState.setOvers(_overs);
  }

  @override
  String toJSON() {
    throw UnimplementedError();
  }
}