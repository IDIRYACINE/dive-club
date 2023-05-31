import 'package:dive_club/core/domain/clubs/mapper.dart';
import 'package:dive_club/core/domain/competition/export.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:dive_club/core/domain/participants/export.dart';
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
