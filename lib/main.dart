import 'package:cricket_scorer/src/screens/play_match.dart';
import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/events/match_event.dart';
import 'package:cricket_scorer/src/core/events/match_start.dart';
import 'package:cricket_scorer/src/core/events/toss.dart';
import 'package:cricket_scorer/src/core/match_summary.dart';
import 'package:cricket_scorer/src/core/models/toss_data.dart';
import 'package:cricket_scorer/src/widgets/title_bar.dart';
import 'package:cricket_scorer/src/widgets/decision_section.dart';
import 'package:cricket_scorer/src/widgets/overs_section.dart';
import 'package:cricket_scorer/src/widgets/team_section.dart';
import 'package:cricket_scorer/src/widgets/toss_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        cardTheme: const CardTheme(
          elevation: 6,
        ),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.ubuntu(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: GoogleFonts.notoSans(fontSize: 20, height: 1.8, fontWeight: FontWeight.bold, color: Colors.black),
          bodySmall: GoogleFonts.sourceSansPro(fontSize: 12, height: 2, color: Colors.black),
        ),
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(),
        "/play-match": (context) => const PlayMatchPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MatchSummary summary = MatchSummary();
  final List<MatchEvent> events = [];
  String _team1 = defaultTeam1Name, _team2 = defaultTeam2Name;
  int _overs = 0;
  TossDecision _tossDecision = TossDecision.batting;
  TeamOrder _tossWinner = TeamOrder.team1;

  void _letsPlay() {
    if (_overs == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 5),
            content: Text('Over cannot be zero'),
          )
      );
      return;
    }
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
        title: const TitleBar(),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
            children: [
              TeamSection(
                team1: _team1,
                team2: _team2,
                onTeam1NameChange: (value) {
                  setState(() {
                    _team1 = value;
                    if (value.trim().isEmpty) {
                      _team1 = defaultTeam1Name;
                    }
                  });
                },
                onTeam2NameChange: (value) {
                  setState(() {
                    _team2 = value;
                    if (value.trim().isEmpty) {
                      _team2 = defaultTeam1Name;
                    }
                  });
                },
              ),
              TossSection(
                team1: _team1,
                team2: _team2,
                toss: _tossWinner,
                onTossWin: (TeamOrder? value) {
                  setState(() {
                    _tossWinner = value!;
                  });
                },
              ),
              DecisionSection(
                decision: _tossDecision,
                onDecisionMaking: (TossDecision? value) {
                  setState(() {
                    _tossDecision = value!;
                  });
                },
              ),
              OversSection(
                overs: _overs,
                onOversChange: (value) {
                  _overs = int.parse(value);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 50,
                  width: 380,
                  child: ElevatedButton(
                    onPressed: _letsPlay,
                    child: const Text("Start Match")
                  ),
                ),
              )
            ],
          ),
        ),
        ],
      ),
    );
  }
}
