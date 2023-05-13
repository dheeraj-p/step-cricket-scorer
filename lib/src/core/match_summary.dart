import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/models/toss_data.dart';

class MatchSummary {
  late Team teamA;
  late Team teamB;
  late TossData _tossData;

  setTeams(String teamAName, String teamBName) {
    teamA = Team(teamAName);
    teamB = Team(teamBName);
  }

  addTossDetails(TeamOrder winner, TossDecision decision) {
    _tossData = TossData(winner, decision);
  }

  TossData get tossData => _tossData;

  @override
  String toString() {
    String result = 'First Team: ${teamA.name} \n';
    result += 'Second Team: ${teamB.name} \n';
    result += 'Toss Won By: ${tossData.winner} ';
    result += 'opted to : ${tossData.decision} First \n';

    return result;
  }
}

class Team {
  final String name;

  const Team(this.name);
}
