import 'package:cricket_scorer/core/constants.dart';

void main(List<String> args) {}

const match = {
  'toss': {'winning_team': '', 'decision': ''},
  'innings': [
    {
      'team': '',
      'overs': [
        {
          'deliveris': [
            {
              'bowler': '',
              'batter': '',
              'non_striker': '',
              'runs': {'extras': 0, 'batter': 0, 'total': 0},
              'extras': {'wide': 0, 'byes': 0, 'leg_byes': 0, 'no_ball': 0},
              'dismissal': {
                'type': '',
                'fielders': [], // Names of fielders involved
                'batter': ''
              }
            }
          ]
        }
      ]
    }
  ]
};

Map<String, dynamic> newMatch(List<String> teams, int tossWonBy, TossDecision tossDecision) {
  return {
    'toss': {'winning_team': teams[tossWonBy], 'decision': tossDecision},
    'innings': [
      {'team': _getBattingTeam(teams, tossWonBy, tossDecision), 'overs': []}
    ]
  };
}

Map<String, dynamic> newDelivery(Map<String, dynamic> match) {
  return {};
}

String _getBattingTeam(
    List<String> teams, int tossWonBy, TossDecision tossDecision) {
  var battingTeam = teams[tossWonBy];
  var tossLosingTeamIndx = (tossWonBy + 1) % 2;
  return tossDecision == TossDecision.batting
      ? battingTeam
      : teams[tossLosingTeamIndx];
}
