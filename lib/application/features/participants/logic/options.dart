import 'package:dive_club/application/features/participants/feature.dart';
import 'package:dive_club/core/domain/participants/entity.dart';
import 'package:flutter/material.dart';

class DisplayActionsOptions {
  final BuildContext context;
  final ParticipantBloc bloc;
  final ParticipantEntity entity;

  DisplayActionsOptions({
    required this.context,
    required this.bloc,
    required this.entity,
  });
}
