class Score {
  final int minutes;
  final int seconds;
  final int milliseconds;
  Score(
    this.minutes,
    this.seconds,
    this.milliseconds,
  );

  static Score fromStringDatetime(String source) {
    final date = DateTime.tryParse(source);

    if (date != null) {
      return Score(date.hour, date.minute, date.second);
    }

    return Score.fromString(source)!;
  }

  static Score? fromString(String source) {
    try {

      List<String> test = source.split(RegExp(r'[.:,\s]'));

      if (test.length == 3) {
        if (test[0].length < 2) {
          test[0] = '0${test[0]}';
        }

        if (test[2].length < 2) {
          test[2] = '0${test[2]}';
        }
      }

      if (test[1] == "00") {
        final temp = test[1];
        test[1] = test[2];
        test[2] = temp;
      }
      
      source = test.join();

      final mm = source.substring(0, 2);
      final ss = source.substring(2, 4);
      final mss = source.substring(4, 6);

      final m = int.parse(mm);
      final s = int.parse(ss);
      final ms = int.parse(mss);

      return Score(m, s, ms);
    } catch (e) {
      return null;
    }
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
  String toString() {
    final m = minutes < 10 ? "0$minutes" : minutes;
    final s = seconds < 10 ? "0$seconds" : seconds;
    final ms = milliseconds < 10 ? "0$milliseconds" : milliseconds;
    return '$m:$s:$ms';
  }

  static Score fromDate(DateTime date) {
    return Score(date.minute, date.second, date.millisecond);
  }
}
