import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Lista app',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.red,
    ),
    home: HomeScreen(),
  ));
}
