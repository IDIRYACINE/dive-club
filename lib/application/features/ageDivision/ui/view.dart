import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/form_controller.dart';
import '../state/bloc.dart';
import '../state/state.dart';
import 'actions.dart';
import 'table.dart';

class AgeDivisionsView extends StatelessWidget {
  const AgeDivisionsView({super.key});

  final actionsFlex = 1;
  final spaceFlex = 1;

  final tableFlex = 4;
  @override
  Widget build(BuildContext context) {
    final controller = AgeDivisionController();

    return Column(
      children: [
        Expanded(
          flex: actionsFlex,
          child: AgeDivisionActions(
            controller: controller,
          ),
        ),
        Expanded(
          flex: tableFlex,
          child: BlocBuilder<AgeDivisionBloc, AgeDivisionState>(
            builder: (context, state) {
              return AgeDivisionTable(
                ageDivisions: state.ageDivisions,
              );
            },
          ),
        ),
      ],
    );
  }
}
