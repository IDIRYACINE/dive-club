

class ParticipantId{
  final int value;

  ParticipantId(this.value);

}

class ParticipantColumn{
  final int value;

  ParticipantColumn._(this.value);

  factory ParticipantColumn.from(int value){
    if(value > 5){
      throw ArgumentError("column can't exceed 5");
    }
    return ParticipantColumn._(5);
  }


}

class ParticipantSeries{
  final int value;

  ParticipantSeries(this.value);
  
}


class ParticipantName{
  final String firstName;
  final String lastName;

  ParticipantName(this.firstName,this.lastName);

  @override
  String toString() {
    return '$firstName $lastName';
  }

}

class ParticipantBirthDate{
  final DateTime value;

  ParticipantBirthDate(this.value);

  int get year => value.year;

  @override 
  String toString(){
    return value.toString();
  }
  

}