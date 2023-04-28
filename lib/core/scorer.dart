import 'package:cricket_scorer/core/constants.dart';
import 'package:cricket_scorer/core/events/match_event.dart';
import 'package:cricket_scorer/core/events/match_start.dart';
import 'package:cricket_scorer/core/events/toss.dart';
import 'package:cricket_scorer/core/match_summary.dart';
import 'package:cricket_scorer/core/models/toss_data.dart';

void main(List<String> args) {
  MatchSummary summary = MatchSummary();
  List<MatchEvent> events = [];

  events.add(MatchStartEvent("Dheeraj", "Tilak"));
  events.add(const TossEvent(TossData("Dheeraj", TossDecision.batting)));

  for (MatchEvent event in events) {
    event.apply(summary);
  }

  print(summary.toString());
}
