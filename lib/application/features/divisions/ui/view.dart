import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/division_controller.dart';
import 'table.dart';

class DivisionsView extends StatelessWidget {
  const DivisionsView({super.key});

  final actionsFlex = 1;
  final spaceFlex = 1;

  final tableFlex = 4;

  @override
  Widget build(BuildContext context) {
    final DivisionController formController = DivisionController();

    return Column(
      children: [
        Expanded(
          flex: actionsFlex,
          child: DivisionsActions(
            formController: formController,
          ),
        ),
        Expanded(
          flex: tableFlex,
          child: BlocBuilder<DivisionBloc, DivisionState>(
            builder: (context, state) {
              return DivisionsTable(
                divisions: state.divisions,
              );
            },
          ),
        ),
      ],
    );
  }
}
