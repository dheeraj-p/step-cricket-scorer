import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/widgets/card_view.dart';
import 'package:flutter/material.dart';

class TossSection extends StatefulWidget {
  String team1;
  String team2;
  TeamOrder? toss;
  Function(TeamOrder?)? onTossWin;

  TossSection({
    super.key,
    required this.team1,
    required this.team2,
    required this.toss,
    required this.onTossWin,
  });

  @override
  State<TossSection> createState() => _NewTossState();

}

class _NewTossState extends State<TossSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardView(
          header: "Toss",
          height: 120,
          width: 380,
          childrenWidgets: [
            ListTile(
              title: Text(
                widget.team1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              leading: Radio<TeamOrder>(
                value: TeamOrder.team1,
                groupValue: widget.toss,
                onChanged: widget.onTossWin,
              ),
            ),
            ListTile(
              title: Text(
                widget.team2,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              leading: Radio<TeamOrder>(
                value: TeamOrder.team2,
                groupValue: widget.toss,
                onChanged: widget.onTossWin,
              ),
            ),
          ],
        ),
      ],
    );
  }

}
