



import 'package:dive_club/application/features/layout/feature.dart';

import '../models/navigation_destination.dart';
import '../state/events.dart';

void handleNavigationButton(AppBloc bloc,NavigationEntity navigationEntity){
  bloc.add(AppNavigate(uniqueId: navigationEntity.uniqueId));
  
}