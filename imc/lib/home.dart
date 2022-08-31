import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  Map<String, dynamic> resultado = {"resultado": 0, "mensagem": ""};

  @override
  Widget build(BuildContext context) {
    InputDecoration inputAlturaDecoration = const InputDecoration(
      label: Text("Altura"),
      suffix: Text(" m"),
    );

    InputDecoration inputPesoDecoration = const InputDecoration(
      label: Text("Peso"),
      suffix: Text(" Kg"),
    );

    void calculateIMC() {
      double altura = double.parse(_alturaController.text.toString());
      double peso = double.parse(_pesoController.text.toString());
    }

    calculateIMC();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Cálculadora de IMC"),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
        ),
        body: Column(children: [
          TextField(
            controller: _alturaController,
            keyboardType: TextInputType.number,
            decoration: inputAlturaDecoration,
          ),
          TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: inputPesoDecoration),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Calcular"),
          ),
        ]));
  }
}
