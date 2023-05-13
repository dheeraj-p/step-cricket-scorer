import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';

class MatchEvent {
  final EventType type;
  final dynamic data;

  void apply(MatchSummary currentState) {
    throw UnimplementedError();
  }

  const MatchEvent(this.type, this.data);
}
