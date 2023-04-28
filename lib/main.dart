import 'package:cricket_scorer/core/events/match_event.dart';
import 'package:cricket_scorer/core/match_summary.dart';
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

class PlayMatchPage extends StatelessWidget {
  const PlayMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Match screen");
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

  void _letsPlay() {
    Navigator.pushNamed(context, '/play-match');
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
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Team 1",
            ),
          ),
          const SizedBox(height: 14),
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Team 2",
            ),
          ),
          const SizedBox(height: 28),
          TossSection(),
          TextButton(onPressed: _letsPlay, child: const Text("Let's Play"))
        ]),
      ),
    );
  }
}

class TossSection extends StatelessWidget {
  const TossSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Toss Winner"),
            DropdownButton(
              items: [
                DropdownMenuItem<String>(value: "Team 1", child: Text("Team 1")),
                DropdownMenuItem<String>(value: "Team 2", child: Text("Team 2")),
              ],
              onChanged: (x) => {},
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Decision"),
            DropdownButton(
              items: [
                DropdownMenuItem<String>(value: "Batting", child: Text("Batting")),
                DropdownMenuItem<String>(value: "Fielding", child: Text("Fielding")),
              ],
              onChanged: (x) => {},
            ),
          ],
        ),
      ],
    );
  }
}
