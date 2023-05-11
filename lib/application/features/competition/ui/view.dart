import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/form_controller.dart';
import '../state/bloc.dart';
import '../state/state.dart';
import 'actions.dart';
import 'table.dart';

class CompetitionScoresView extends StatelessWidget {
  const CompetitionScoresView({super.key});

  final actionsFlex = 1;
  final spaceFlex = 1;

  final tableFlex = 4;
  @override
  Widget build(BuildContext context) {
    final controller = ScoreController();

    return Column(
      children: [
        Expanded(
          flex: actionsFlex,
          child: CompetitionActions(
            controller: controller,
          ),
        ),
        Expanded(
          flex: tableFlex,
          child: BlocBuilder<CompetitionBloc, CompetitionState>(
            builder: (context, state) {
              return CompetitionTable(
                scores: state.scores,
              );
            },
          ),
        ),
      ],
    );
  }
}
