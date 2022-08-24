import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello World"),
          backgroundColor: Colors.purple[800],
          centerTitle: true,
        ),
        body: const Center(
          child: Text("Hello World",
              style: TextStyle(
                fontSize: 30,
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              )),
        ));
  }
}
