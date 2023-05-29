import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';

class RunsEvent implements MatchEvent {
  final int _value;

  const RunsEvent(this._value);

  bool _shouldChangeStrike() {
    return _value.isOdd;
  }

  @override
  void apply(MatchSummary currentState) {
    currentState.addRunsToBatter(_value);
    currentState.addRunsToBowler(_value);
    currentState.addBallToBowler();
    if (_shouldChangeStrike()) {
      currentState.rotateStrike();
    }
  }

  @override
  String toJSON() {
    throw UnimplementedError();
  }
}
