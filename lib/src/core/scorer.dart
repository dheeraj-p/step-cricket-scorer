import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/events/match_start.dart';
import 'package:cricket_scorer/src/core/events/set_overs.dart';
import 'package:cricket_scorer/src/core/events/toss.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';
import 'package:cricket_scorer/src/core/models/toss_data.dart';

void main(List<String> args) {
  MatchSummary summary = MatchSummary();
  List<MatchEvent> events = [];

  events.add(MatchStartEvent("Dheeraj", "Tilak"));
  events.add(const TossEvent(TossData(TeamOrder.team1, TossDecision.batting)));
  events.add(SetOversEvent(10));

  for (MatchEvent event in events) {
    event.apply(summary);
  }

  print(summary.toString());
}
