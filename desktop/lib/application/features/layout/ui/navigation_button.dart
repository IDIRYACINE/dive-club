import 'package:dive_club/application/features/layout/models/navigation_destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/helpers.dart';
import '../state/bloc.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton(
      {super.key, required this.navigationEntity, required this.selectedIndex});

  final NavigationEntity navigationEntity;
  final int selectedIndex;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = selectedIndex == navigationEntity.uniqueId;
    final frontColor =
        isSelected ? theme.colorScheme.surface : theme.primaryColor;
    final backgroundColor =
        isSelected ? theme.primaryColor : theme.colorScheme.surface;
    final textStyle =   theme.textTheme.bodyLarge!.copyWith(color: frontColor) ;

    final bloc = BlocProvider.of<AppBloc>(context);

    return MaterialButton(
      onPressed: () =>     handleNavigationButton(bloc,navigationEntity),
      color: backgroundColor,
      child: Row(
        children: [
          Icon(
            navigationEntity.icon,
            color: frontColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            navigationEntity.title,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
