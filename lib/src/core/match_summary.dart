import 'package:cricket_scorer/src/core/constants.dart';
import 'package:cricket_scorer/src/core/models/player.dart';
import 'package:cricket_scorer/src/core/models/toss_data.dart';

class MatchSummary {
  late Team _teamA;
  late Team _teamB;
  late TossData _tossData;
  late int _totalOvers;
  late Player _striker;
  late Player _nonStriker;
  late Player _bowler;

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

  setStriker(Player batter) {
    _striker = batter;
  }

  setNonStriker(Player batter) {
    _nonStriker = batter;
  }

  setBowler(Player bowler) {
    _bowler = bowler;
  }

  TossData get tossData => _tossData;

  @override
  String toString() {
    String result = 'First Team: ${_teamA.name} \n';
    result += 'Second Team: ${_teamB.name} \n';
    result += 'Toss Won By: ${tossData.winner} \n';
    result += 'opted to : ${tossData.decision} First \n';
    result += 'Total Overs : $_totalOvers \n';
    result += 'On Strike : $_striker \n';
    result += 'On non-Strike : $_nonStriker \n';
    result += 'Bowler : $_bowler \n';

    return result;
  }
}

class Team {
  final String name;

  const Team(this.name);
}
