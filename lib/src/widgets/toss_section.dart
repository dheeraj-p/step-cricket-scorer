import 'package:cricket_scorer/src/core/constants.dart';
import 'package:flutter/material.dart';

class TossSection extends StatelessWidget {
  final void Function(TeamOrder?)? onTossWinnerChange;
  final void Function(TossDecision?)? onTossDecisionChange;
  final TeamOrder? winnerTeam;
  final TossDecision? decision;

  const TossSection({
    super.key,
    this.onTossWinnerChange,
    this.onTossDecisionChange,
    this.decision,
    this.winnerTeam,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Toss Winner:"),
            DropdownButton(
              items: const [
                DropdownMenuItem<TeamOrder>(value: TeamOrder.team1, child: Text("Team 1")),
                DropdownMenuItem<TeamOrder>(value: TeamOrder.team2, child: Text("Team 2")),
              ],
              onChanged: onTossWinnerChange,
              value: winnerTeam,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Decision:"),
            DropdownButton(
              items: const [
                DropdownMenuItem<TossDecision>(value: TossDecision.batting, child: Text("Batting")),
                DropdownMenuItem<TossDecision>(value: TossDecision.fielding, child: Text("Fielding")),
              ],
              onChanged: onTossDecisionChange,
              value: decision,
            ),
          ],
        ),
      ],
    );
  }
}
