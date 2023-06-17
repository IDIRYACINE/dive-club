import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/bloc.dart';
import '../state/state.dart';
import 'app_content.dart';
import 'app_drawer.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  final drawerFlex = 1;
  final contentFlex = 3;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: drawerFlex,
              child: AppDrawer(
                navigations: state.navigations,
                selectedIndex: state.selectedIndex,
              ),
            ),
            Expanded(
              flex: contentFlex,
              child: AppContent(index:state.selectedIndex),)
          ],

        );
      },
    );
  }
}
