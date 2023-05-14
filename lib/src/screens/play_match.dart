import 'package:flutter/material.dart';

import '../core/match_summary.dart';

class PlayMatchPage extends StatelessWidget {
  const PlayMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MatchSummary summary = ModalRoute.of(context)?.settings.arguments as MatchSummary;

    return Scaffold(
      appBar: AppBar(title: Text("STEP Cricket")),
      body: Column(
        children: [
          Row(
            children: [
              Column(),
              Column()
            ],
          ),
        ],
      ),
    );
  }
}
