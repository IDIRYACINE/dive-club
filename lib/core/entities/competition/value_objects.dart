class Score {
  final int minutes;
  final int seconds;
  final int milliseconds;
  Score(
    this.minutes,
    this.seconds,
    this.milliseconds,
  );

  factory Score.fromStringDatetime(String source) {
    final date = DateTime.tryParse(source);

    if(date != null){
      return Score(date.hour, date.minute, date.second);
    }

    return Score.fromString(source);
  }

  factory Score.fromString(String source) {
    source = source.replaceAll(RegExp(r'[.:]'), '');


    final mm =source.substring(0, 2);
    final ss = source.substring(2, 4);
    final mss = source.substring(4, 6);



    final m = int.parse(mm);
    final s = int.parse(ss);
    final ms = int.parse(mss);

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
    final m = minutes < 10 ? "0$minutes" : minutes;
    final s = seconds < 10 ? "0$seconds" : seconds;
    final ms = milliseconds < 10 ? "0$milliseconds" : milliseconds;
    return '$m:$s:$ms';
  }

  static Score fromDate(DateTime date) {
    return Score(
      date.minute, date.second, date.millisecond
    );
  }
}
