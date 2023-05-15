import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/widgets/card_view.dart';
import 'package:flutter/material.dart';

class DecisionSection extends StatelessWidget {
  TossDecision? decision;
  Function(TossDecision?)? onDecisionMaking;

  DecisionSection({
    super.key,
    required this.decision,
    required this.onDecisionMaking,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardView(
          header: "Decision",
          height: 120,
          width: 380,
          childrenWidgets: [
            ListTile(
              title: Text(
                "Batting",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              leading: Radio<TossDecision>(
                value: TossDecision.batting,
                groupValue: decision,
                onChanged: onDecisionMaking,
              ),
            ),
            ListTile(
              title: Text(
                "Fielding",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              leading: Radio<TossDecision>(
                value: TossDecision.fielding,
                groupValue: decision,
                onChanged: onDecisionMaking,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
