class GenderId {
  final int value;

  GenderId(this.value);

  factory GenderId.fromString(String value) {
    value = value.toUpperCase();
    if (value == "H" || value == "G" || value == "M") {
      return GenderId(0);
    }


    return GenderId(1);
  }

  bool equals(GenderId currGender) {
    return currGender.value == value;
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
