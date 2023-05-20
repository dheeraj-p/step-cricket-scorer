import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';
import 'package:cricket_scorer/src/core/models/batter.dart';

class BatterChangeEvent implements MatchEvent {
  final String name;
  final BatterEnd batterEnd;

  const BatterChangeEvent(this.name, this.batterEnd);

  bool _isStriker() {
    return batterEnd == BatterEnd.striker;
  }

  @override
  void apply(MatchSummary currentState) {
    Batter batter = Batter(name);
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
