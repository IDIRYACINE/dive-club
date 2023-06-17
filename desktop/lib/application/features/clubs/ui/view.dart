import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/form_controller.dart';
import '../state/bloc.dart';
import '../state/state.dart';
import 'actions.dart';
import 'table.dart';

class ClubsView extends StatelessWidget {
  const ClubsView({super.key});

  final actionsFlex = 1;
  final spaceFlex = 1;

  final tableFlex = 4;
  @override
  Widget build(BuildContext context) {
    final controller = ClubController();

    return Column(
      children: [
        Expanded(
          flex: actionsFlex,
          child: ClubActions(
            controller: controller,
          ),
        ),
        Expanded(
          flex: tableFlex,
          child: BlocBuilder<ClubBloc, ClubState>(
            builder: (context, state) {
              return ClubTable(
                clubs: state.clubs,
              );
            },
          ),
        ),
      ],
    );
  }
}
