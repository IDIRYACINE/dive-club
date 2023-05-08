abstract class AppEvent {}

class AppNavigate extends AppEvent {
  final int uniqueId;

  AppNavigate({required this.uniqueId});
}
