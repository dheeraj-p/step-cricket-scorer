import 'package:cricket_scorer/src/screens/play_match.dart';
import 'package:cricket_scorer/src/widgets/input_text.dart';
import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/events/match_start.dart';
import 'package:cricket_scorer/src/core/events/toss.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';
import 'package:cricket_scorer/src/core/models/toss_data.dart';
import 'package:cricket_scorer/src/widgets/toss_section.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STEP Cricket',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: 'STEP Cricket'),
        "/play-match": (context) => const PlayMatchPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MatchSummary summary = MatchSummary();
  final List<MatchEvent> events = [];
  String _team1 = "Team 1", _team2 = "Team 2";
  TossDecision _tossDecision = TossDecision.batting;
  TeamOrder _tossWinner = TeamOrder.team1;

  void _letsPlay() {
    events.add(MatchStartEvent(_team1, _team2));
    events.add(TossEvent(TossData(_tossWinner, _tossDecision)));

    for (var event in events) {
      event.apply(summary);
    }

    Navigator.pushNamed(context, '/play-match', arguments: summary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          InputText(
            label: "Team 1",
            onChanged: (v) => _team1 = v,
          ),
          const SizedBox(height: 14),
          InputText(
            label: "Team 2",
            onChanged: (v) => _team2 = v,
          ),
          const SizedBox(height: 28),
          TossSection(
            onTossDecisionChange: (decision) => setState(() {
              _tossDecision = decision!;
            }),
            onTossWinnerChange: (winner) => setState(() {
              _tossWinner = winner!;
            }),
            winnerTeam: _tossWinner,
            decision: _tossDecision,
          ),
          TextButton(onPressed: _letsPlay, child: const Text("Let's Play"))
        ]),
      ),
    );
  }
}
