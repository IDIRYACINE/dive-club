

import 'package:dive_club/application/features/participants/state/bloc.dart';
import 'package:dive_club/application/features/participants/state/state.dart';
import 'package:dive_club/application/features/participants/ui/table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/participant_controller.dart';
import 'actions.dart';

class ParticipantsView extends StatelessWidget{
  const ParticipantsView({super.key});

  @override
  Widget build(BuildContext context) {
    final  controller = ParticipantController();
    return Column(
      children:  [
        ParticipantsActions(controler: controller,),
        BlocBuilder<ParticipantBloc,ParticipantState>(
          builder: (context,state) {
            return ParticipantsTable(participants: state.participants,);
          }
        ),
      ],
    );
  }
}