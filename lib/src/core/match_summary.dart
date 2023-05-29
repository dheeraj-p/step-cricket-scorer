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
  late Team _battingTeam;
  late Team _bowlingTeam;

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

  setStriker(String batterName) {
    Player batter = _battingTeam.getOrAddPlayer(batterName, Player.from(batterName));
    _striker = batter;
  }

  setNonStriker(String batterName) {
    Player batter = _battingTeam.getOrAddPlayer(batterName, Player.from(batterName));
    _nonStriker = batter;
  }

  setBowler(String bowlerName) {
    Player bowler = _bowlingTeam.getOrAddPlayer(bowlerName, Player.from(bowlerName));
    _bowler = bowler;
  }

  setBattingTeam(Team battingTeam) {
    _battingTeam = battingTeam;
  }

  setBowlingTeam(Team bowlingTeam) {
    _bowlingTeam = bowlingTeam;
  }

  addRunsToBatter(int runs) {
    _striker.score(runs);
  }

  addRunsToBowler(int runs) {
    _bowler.concede(runs);
  }

  addBallToBowler() {
    _bowler.addBallToBowlingStats();
  }

  rotateStrike() {
    final Player prevStriker = _striker;
    _striker = _nonStriker;
    _nonStriker = prevStriker;
  }

  TossData get tossData => _tossData;

  Map<TeamOrder, Team> get teams {
    return {
      TeamOrder.team1: _teamA,
      TeamOrder.team2: _teamB,
    };
  }

  @override
  String toString() {
    String result = 'First Team: ${_teamA.name} \n';
    result += 'Second Team: ${_teamB.name} \n';
    result += 'Toss Won By: ${tossData.winner} \n';
    result += 'opted to : ${tossData.decision} First \n';
    result += 'Total Overs : $_totalOvers \n';
    result += 'On Strike : ${_striker.name} \n';
    result += 'On non-Strike : ${_nonStriker.name} \n';
    result += 'Bowler : ${_bowler.name} \n';
    result += '=============>>> Stats <<<=============\n';
    result += '$_striker\n';
    result += '$_nonStriker\n';
    result += '$_bowler\n';
    
    return result;
  }
}

class Team {
  final String name;
  final List<Player> _players = [];

  Team(this.name);

  getOrAddPlayer(String playerName, Player defaultPlayer) {
    if (_hasPlayer(playerName)) {
      return _players.firstWhere((Player p) => p.name == playerName);
    }

    _players.add(defaultPlayer);
    return defaultPlayer;
  }

  bool _hasPlayer(String playerName) => _players.any((Player p) => p.name == playerName);
}
