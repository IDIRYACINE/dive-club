class Score {
  final int minutes;
  final int seconds;
  final int milliseconds;
  Score(
    this.minutes,
    this.seconds,
    this.milliseconds,
  );

  factory Score.fromString(String source) {
    final m = int.parse(source.substring(0, 2));
    final s = int.parse(source.substring(2, 4));
    final ms = int.parse(source.substring(4, 6));

    return Score(m, s, ms);
  }
  factory Score.fromInt(int score) {
    final m = score ~/ 10000;
    final s = (score % 10000) ~/ 100;
    final ms = score % 100;

    return Score(m, s, ms);
  }

  int toIntCode() {
    return minutes * 10000 + seconds * 100 + milliseconds;
  }

  @override
  String toString(){
    return '$minutes:$seconds:$milliseconds';
  }
}
