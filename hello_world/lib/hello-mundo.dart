import 'package:flutter/material.dart';

class HelloMundo extends StatefulWidget {
  const HelloMundo({super.key});

  @override
  State<HelloMundo> createState() => _HelloMundoState();
}

class _HelloMundoState extends State<HelloMundo> {
  TextEditingController _nomeController = TextEditingController();
  String nome = "Default";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello Mundo"),
          centerTitle: true,
          backgroundColor: Colors.green[300],
        ),
        body: Column(children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                label: Text("Digite seu nome"),
              ),
            ),
          ),
          Container(
            width: 300,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  nome = _nomeController.text.toString();
                });
              },
              child: const Text("Digite aqui"),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            nome,
            style: const TextStyle(fontSize: 30, color: Colors.red),
          ),
        ]));
  }
}
