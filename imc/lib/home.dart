import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var inputAlturaDecoration = const InputDecoration(
    label: Text("Altura"),
    suffix: Text(" m"),
  );

  var inputPesoDecoration = const InputDecoration(
    label: Text("Peso"),
    suffix: Text(" Kg"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Cálculadora de IMC"),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
        ),
        body: Column(children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: inputAlturaDecoration,
          ),
          TextField(
              keyboardType: TextInputType.number,
              decoration: inputPesoDecoration),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Calcular"),
          ),
        ]));
  }
}
