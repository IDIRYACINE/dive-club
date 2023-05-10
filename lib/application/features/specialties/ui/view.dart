import 'package:dive_club/application/features/specialties/state/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/form_controller.dart';
import '../state/state.dart';
import 'actions.dart';
import 'table.dart';

class SpecialtiesView extends StatelessWidget {
  const SpecialtiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SpecialtyController();

    return Column(
      children: [
        SpecialtiesActions(
          controller: controller,
        ),
        BlocBuilder<SpecialtyBloc, SpecialtyState>(builder: (context, state) {
          return SpecialtiesTable(
            specialties: state.specialties,
          );
        }),
      ],
    );
  }
}
