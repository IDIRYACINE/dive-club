

import 'package:flutter/material.dart';

import 'actions.dart';
import 'table.dart';

class SpecialtiesView extends StatelessWidget{
  const SpecialtiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SpecialtiesActions(),
        SpecialtiesTable(),
      ],
    );
  }
}