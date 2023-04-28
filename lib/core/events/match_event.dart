import 'package:cricket_scorer/core/constants.dart';
import 'package:cricket_scorer/core/match_summary.dart';

class MatchEvent {
  final EventType type;
  final dynamic data;

  void apply(MatchSummary currentState) {
    throw UnimplementedError();
  }

  const MatchEvent(this.type, this.data);
}
