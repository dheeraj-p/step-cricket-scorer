import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/events/bowler_change.dart';
import 'package:cricket_scorer/src/core/events/deliveries/runs.dart';
import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/events/batter_change.dart';
import 'package:cricket_scorer/src/core/events/match_start.dart';
import 'package:cricket_scorer/src/core/events/overs_set.dart';
import 'package:cricket_scorer/src/core/events/toss.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';
import 'package:cricket_scorer/src/core/models/toss_data.dart';

void main(List<String> args) {
  MatchSummary summary = MatchSummary();
  List<MatchEvent> events = [];

  events.add(MatchStartEvent("Dheeraj", "Tilak"));
  events.add(const TossEvent(TossData(TeamOrder.team1, TossDecision.batting)));
  events.add(OversSetEvent(10));
  events.add(const BatterChangeEvent("Dheeraj", BatterEnd.striker));
  events.add(const BatterChangeEvent("Chandan", BatterEnd.nonStriker));
  events.add(const BowlerChangeEvent("Tilak"));
  events.add(const RunsEvent(2));
  events.add(const RunsEvent(2));
  events.add(const RunsEvent(2));
  events.add(const RunsEvent(2));
  events.add(const RunsEvent(2));
  events.add(const RunsEvent(2));

  for (MatchEvent event in events) {
    event.apply(summary);
  }

  print(summary.toString());
}
