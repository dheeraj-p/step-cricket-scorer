class Batter {
  final String _name;
  int _runs = 0;
  int _sixes = 0;
  int _fours = 0;
  int _balls = 0;

  Batter(this._name);

  @override
  String toString() {
    return _name;
  }
}
