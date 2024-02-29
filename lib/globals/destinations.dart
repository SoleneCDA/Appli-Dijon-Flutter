import 'package:flutter/material.dart';
import 'package:petite_appli/views/tabs/BooksView.dart';
import 'package:petite_appli/views/tabs/ParkingView.dart';

List<Widget> views = const <Widget>[
  ParkingView(),
  BooksView(),
];

List<Widget> destinations = const <Widget>[
  NavigationDestination(
    icon: Icon(Icons.local_parking_outlined),
    label: 'Parkings',
  ),
  NavigationDestination(
    icon: Icon(Icons.auto_stories_outlined),
    label: 'Boîtes à livres',
  ),
  NavigationDestination(
    icon: Icon(Icons.local_library_outlined),
    label: 'Culture',
  ),
  NavigationDestination(
    icon: Icon(Icons.child_care_outlined),
    label: 'Jeux',
  ),
];
