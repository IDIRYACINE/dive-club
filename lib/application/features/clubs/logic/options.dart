import 'package:dive_club/application/features/clubs/feature.dart';
import 'package:dive_club/core/entities/clubs/export.dart';
import 'package:flutter/material.dart';

class DisplayActionsOptions {
  final BuildContext context;
  final ClubBloc bloc;
  final ClubEntity entity;

  DisplayActionsOptions({
    required this.context,
    required this.bloc,
    required this.entity,
  });
}
