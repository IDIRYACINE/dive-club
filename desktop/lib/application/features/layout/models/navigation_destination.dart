import 'package:dive_club/application/navigation/routes.dart';
import 'package:flutter/material.dart';

class NavigationEntity {
  final String title;
  final String route;
  final int uniqueId;
  final IconData icon;

  const NavigationEntity(
      {required this.uniqueId,
      required this.title,
      required this.route,
      required this.icon});
}

const navgiationDestinations = [
  NavigationEntity(
      title: 'Participants',
      route: Routes.participantRoute,
      uniqueId: 0,
      icon: Icons.home),
  NavigationEntity(
      title: 'Divisions',
      route: Routes.divisionsRoute,
      uniqueId: 1,
      icon: Icons.event),
  NavigationEntity(
      title: 'Specialties',
      route: Routes.specialties,
      uniqueId: 2,
      icon: Icons.event),
      NavigationEntity(
      title: 'AgeDivisions',
      route: Routes.ageDivisions,
      uniqueId: 3,
      icon: Icons.event),
      NavigationEntity(
      title: 'Clubs',
      route: Routes.clubs,
      uniqueId: 4,
      icon: Icons.event),
  NavigationEntity(
      title: 'Competition',
      route: Routes.competitionRoute,
      uniqueId: 5,
      icon: Icons.event),
  NavigationEntity(
      title: 'Settings',
      route: Routes.settingsRoute,
      uniqueId: 6,
      icon: Icons.settings),
];
