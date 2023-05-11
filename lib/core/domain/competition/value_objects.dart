class Score {
  final double value;
  Score(
    this.value,
  );

  factory Score.fromString(String source) {
    return Score(double.parse(source));
  }
}
