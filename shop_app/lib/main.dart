import 'package:flutter/material.dart';

import 'home-screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Shopee',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),
    home: const HomeScreen(),
  ));
}
