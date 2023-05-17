import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/widgets/card_view.dart';
import 'package:flutter/material.dart';

class TeamSection extends StatelessWidget {
  String team1;
  String team2;
  Function(String)? onTeam1NameChange;
  Function(String)? onTeam2NameChange;

  TeamSection({super.key, required this.team1, required this.team2, required this.onTeam1NameChange, required this.onTeam2NameChange});

  String? checkEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "please enter a team name";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardView(
            header: "Teams",
            height: 150,
            width: 380,
            childrenWidgets: [
              TextFormField(
                validator: checkEmpty,
                onChanged: onTeam1NameChange,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Team 1 Name'
                ),
              ),
              TextFormField(
                validator: checkEmpty,
                onChanged: onTeam2NameChange,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Team 2 Name'
                ),
              ),
            ]
        ),
      ],
    );
  }
}
