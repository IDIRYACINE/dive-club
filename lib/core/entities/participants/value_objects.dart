

class ParticipantId{
  final int value;

  ParticipantId(this.value);

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