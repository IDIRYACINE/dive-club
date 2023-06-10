import 'package:flutter/material.dart';
export 'routes.dart';
export 'router.dart';

abstract class NavigationService {
  NavigationService._();

  static final key = GlobalKey<NavigatorState>();
  static BuildContext get currentContext => key.currentState!.context;

  static bool get canPop => key.currentState!.canPop();

  static void popUntilIsFirst() {
    return key.currentState!.popUntil(
      (route) => route.isFirst,
    );
  }

  static Future displayDialog(Widget dialog,
      {Color? barrierColor = Colors.black54}) {
    return showDialog(
        barrierColor: barrierColor,
        context: currentContext,
        builder: (context) => dialog);
  }

  static Future pushNamed(String route, {arguments}) {
    return key.currentState!.pushNamed(route, arguments: arguments);
  }

  static Future pushNamedReplacement(String route, {arguments}) {
    return key.currentState!.pushReplacementNamed(route, arguments: arguments);
  }

  static void replaceDialog(Widget dialog) {
    Navigator.of(currentContext).pop();
    displayDialog(dialog);
  }

  static Future pushNamedAndClear(String route, {arguments}) {
    return key.currentState!.pushNamedAndRemoveUntil(
      route,
      (_) => false,
      arguments: arguments,
    );
  }

  static void push(Widget view) {
    final route = MaterialPageRoute(builder: (context) => view);
    key.currentState!.push(route);
  }

  static Future<bool> maybePop([result]) {
    return key.currentState!.maybePop(result);
  }

  static void pop([result]) {
    if (canPop) return key.currentState!.pop(result);
  }

  static void setBottomBarIndex(int index) {
    _bottomIndex.value = index;
  }

  static final ValueNotifier<int> _bottomIndex = ValueNotifier<int>(0);

  static ValueNotifier<int> get bottomBarIndex => _bottomIndex;
}
