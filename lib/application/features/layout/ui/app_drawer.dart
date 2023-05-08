import 'package:dive_club/application/features/layout/models/navigation_destination.dart';
import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';
import 'navigation_button.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer(
      {super.key, this.verticalSpacing = 10, required this.navigations, required this.selectedIndex});

  final double verticalSpacing;
  final List<NavigationEntity> navigations;
  final int selectedIndex ;

  @override
  Widget build(BuildContext context) {
    final tehme = Theme.of(context);
    return ColoredBox(
      color: tehme.colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(AppMeasures.paddingSmall),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: navigations.length,
                itemBuilder: (context, index) => NavigationButton(
                  selectedIndex: selectedIndex,
                  navigationEntity: navigations[index],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: verticalSpacing,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
