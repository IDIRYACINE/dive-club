import 'package:dive_club/application/features/ageDivision/feature.dart';
import 'package:dive_club/core/domain/diving/entity.dart';
import 'package:flutter/material.dart';

class DisplayActionsOptions {
  final BuildContext context;
  final AgeDivisionBloc bloc;
  final AgeDivisionEntity entity;

  DisplayActionsOptions({
    required this.context,
    required this.bloc,
    required this.entity,
  });
}
