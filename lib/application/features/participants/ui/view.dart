

import 'package:dive_club/application/features/participants/ui/table.dart';
import 'package:flutter/material.dart';

import 'actions.dart';

class ParticipantsView extends StatelessWidget{
  const ParticipantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ParticipantsActions(),
        ParticipantsTable(),
      ],
    );
  }
}