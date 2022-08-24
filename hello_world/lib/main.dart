import 'package:flutter/material.dart';
import 'package:hello_world/hello-world.dart';

void main() {
  runApp(MaterialApp(
    title: 'Hello World',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HelloWorld(),
  ));
}
