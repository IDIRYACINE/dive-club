import 'package:dive_club/application/features/divisions/feature.dart';
import 'package:dive_club/application/features/participants/feature.dart';
import 'package:dive_club/application/features/specialties/feature.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';

class AppContent extends StatelessWidget {
  const AppContent({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppMeasures.paddings),
        child: IndexedStack(
          index: index,
          children: const [
            ParticipantsView(),
            DivisionsView(),
            SpecialtiesView(),
          ],
        ),
      ),
    );
  }
}
