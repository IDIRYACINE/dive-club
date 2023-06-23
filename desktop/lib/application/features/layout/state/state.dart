import '../models/navigation_destination.dart';

class AppState {
  final int selectedIndex;
  final List<NavigationEntity> navigations;

  AppState({
    required this.selectedIndex,
    required this.navigations,
  });

  factory AppState.initialState() {
    return AppState(
      selectedIndex: 0,
      navigations: navgiationDestinations,
    );
  }

  AppState copyWith({
    int? selectedIndex,
    List<NavigationEntity>? navigations,
  }) {
    return AppState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      navigations: navigations ?? this.navigations,
    );
  }
}
