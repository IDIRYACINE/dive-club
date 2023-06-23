import 'package:dive_club/application/features/specialties/state/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/form_controller.dart';
import '../state/state.dart';
import 'actions.dart';
import 'table.dart';

class SpecialtiesView extends StatelessWidget {
  const SpecialtiesView({super.key});

  final actionsFlex = 1;
  final spaceFlex = 1;

  final tableFlex = 4;
  @override
  Widget build(BuildContext context) {
    final controller = SpecialtyController();

    return Column(
      children: [
        Expanded(
          flex: actionsFlex,
          child: SpecialtiesActions(
            controller: controller,
          ),
        ),
        Expanded(
          flex: tableFlex,
          child: BlocBuilder<SpecialtyBloc, SpecialtyState>(
            builder: (context, state) {
              return SpecialtiesTable(
                specialties: state.specialties,
              );
            },
          ),
        ),
      ],
    );
  }
}
