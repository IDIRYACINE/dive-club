import 'package:dive_club/core/entities/clubs/mapper.dart';
import 'package:dive_club/core/entities/competition/export.dart';
import 'package:dive_club/core/entities/diving/export.dart';
import 'package:dive_club/core/entities/participants/export.dart';
import 'package:dive_club/core/infrastrucutre/database/export.dart';

class MapperService implements MapperServicePort {
  @override
  final DivisionMapperPort competitionMapper = DivisionMapper();

  @override
  final ParticipantMapperPort participantMapper = ParticipantMapper();

  @override
  final ScoreMapperPort scoreMapper = ScoreMapper();

  @override
  final SpecialityMapperPort specialtyMapper = SpecialtyMapper();
  
  @override
  AgeDivisionMapperPort get ageDivisonMapper => AgeDivisionMapper();
  
  @override
  ClubMapperPort get clubMapper => ClubMapper();
}
