

class DivisionId{
  final int value;

  DivisionId(this.value);
}

class DivisionName{
  final String value;

  DivisionName(this.value);
}

class SpecialtyId{
  final int value;

  SpecialtyId(this.value);
}

class SpecialtyName{
  final String value;

  SpecialtyName(this.value);
}

class AgeDivisionId{
  final int value;

  AgeDivisionId(this.value);

  factory AgeDivisionId.fromString(value) {
    return AgeDivisionId (int.tryParse(value) ?? 1);

  }

}

class AgeDivisionName{
  final String value ;

  AgeDivisionName(this.value);

}