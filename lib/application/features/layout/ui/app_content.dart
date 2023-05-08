import 'package:flutter/material.dart';

class AppContent extends StatelessWidget {
  const AppContent({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: const [
        Text("screen 0 "),
        Text("screen 1 "),
      ],
    );
  }
}
