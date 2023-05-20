import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/models/toss_data.dart';

class MatchSummary {
  late Team _teamA;
  late Team _teamB;
  late TossData _tossData;
  late int _totalOvers;

  setTeams(String teamAName, String teamBName) {
    _teamA = Team(teamAName);
    _teamB = Team(teamBName);
  }

  addTossDetails(TeamOrder winner, TossDecision decision) {
    _tossData = TossData(winner, decision);
  }

  setOvers(int overs) {
    _totalOvers = overs;
  }

  TossData get tossData => _tossData;

  @override
  String toString() {
    String result = 'First Team: ${_teamA.name} \n';
    result += 'Second Team: ${_teamB.name} \n';
    result += 'Toss Won By: ${tossData.winner} \n';
    result += 'opted to : ${tossData.decision} First \n';
    result += 'Total Overs : $_totalOvers \n';

    return result;
  }
}

class Team {
  final String name;

  const Team(this.name);
}
