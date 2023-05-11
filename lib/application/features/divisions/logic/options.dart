import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/core/domain/diving/export.dart';
import 'package:flutter/material.dart';

class DisplayActionsOptions {
  final BuildContext context;
  final DivisionBloc bloc;
  final DivingDivisionEntity entity;

  DisplayActionsOptions({
    required this.context,
    required this.bloc,
    required this.entity,
  });
}
