import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/widgets/card_view.dart';
import 'package:flutter/material.dart';

class DecisionSection extends StatefulWidget {
  TossDecision? decision;
  Function(TossDecision?)? onDecisionMaking;

  DecisionSection({
    super.key,
    required this.decision,
    required this.onDecisionMaking,
  });

  @override
  State<DecisionSection> createState() => _NewDecisionState();

}

class _NewDecisionState extends State<DecisionSection> {
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
                groupValue: widget.decision,
                onChanged: widget.onDecisionMaking,
              ),
            ),
            ListTile(
              title: Text(
                "Fielding",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              leading: Radio<TossDecision>(
                value: TossDecision.fielding,
                groupValue: widget.decision,
                onChanged: widget.onDecisionMaking,
              ),
            ),
          ],
        ),
      ],
    );
  }

}
