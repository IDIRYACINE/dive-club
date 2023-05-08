

import 'package:dive_club/application/navigation/routes.dart';
import 'package:flutter/material.dart';

class NavigationEntity{
  final String title;
  final String route;
  final int uniqueId;
  final IconData icon;

  const NavigationEntity( {required this.uniqueId,required this.title,required  this.route,required  this.icon});

}


const navgiationDestinations = [
  NavigationEntity(title: 'Participants', route: Routes.participantRoute, uniqueId: 0, icon: Icons.home ),
  NavigationEntity(title: 'Competition', route: Routes.competitionRoute, uniqueId: 1, icon: Icons.event ),
];


