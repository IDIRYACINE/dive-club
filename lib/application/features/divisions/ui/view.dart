

import 'package:flutter/material.dart';

import 'actions.dart';
import 'table.dart';

class DivisionsView extends StatelessWidget{
  const DivisionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DivisionsActions(),
        DivisionsTable(),
      ],
    );
  }
}