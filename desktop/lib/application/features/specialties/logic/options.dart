import 'package:dive_club/application/features/specialties/feature.dart';
import 'package:dive_club/core/entities/diving/entity.dart';
import 'package:flutter/material.dart';

class DisplayActionsOptions {
  final BuildContext context;
  final SpecialtyBloc bloc;
  final DivingSpecialtyEntity entity;

  DisplayActionsOptions({
    required this.context,
    required this.bloc,
    required this.entity,
  });
}
