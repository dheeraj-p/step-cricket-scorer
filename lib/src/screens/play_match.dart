import 'package:cricket_scorer/src/widgets/title_bar.dart';
import 'package:flutter/material.dart';

import '../core/match_summary.dart';

class PlayMatchPage extends StatelessWidget {
  const PlayMatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MatchSummary summary = ModalRoute.of(context)?.settings.arguments as MatchSummary;

    return Scaffold(
      appBar: AppBar(title: const TitleBar()),
      body: Column(
        children: [
          Row(
            children: [
              Text(summary.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
