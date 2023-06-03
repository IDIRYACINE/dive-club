class GenderId {
  final int value;

  GenderId(this.value);

  factory GenderId.fromString(String value) {
    if (value == "H" || value == "G") {
      return GenderId(0);
    }


    return GenderId(1);
  }
}

class GenderName {
  final String value;

  GenderName(this.value);

  factory GenderName.male() {
    return GenderName("H");
  }

  factory GenderName.female() {
    return GenderName("F");
  }
}
