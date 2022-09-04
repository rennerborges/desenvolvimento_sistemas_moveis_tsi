import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();
  Map<String, dynamic> _resultado = {
    "resultado": "",
    "mensagem": "",
    "color": Colors.grey,
  };

  @override
  Widget build(BuildContext context) {
    InputDecoration inputAlturaDecoration = const InputDecoration(
      label: Text("Altura (metro)"),
    );

    InputDecoration inputPesoDecoration = const InputDecoration(
      label: Text("Peso (kilo)"),
    );

    void calculateIMC() {
      double altura = double.parse(_alturaController.text.toString());
      double peso = double.parse(_pesoController.text.toString());

      double imc = peso / (altura * altura);
      String imcFormatado = imc.toStringAsFixed(2);

      setState(() {
        if (imc <= 18.5) {
          _resultado = {
            "resultado": imcFormatado,
            "mensagem": "Abaixo do peso!",
            "color": Colors.red[800],
          };
        } else if (imc >= 18.6 && imc <= 24.9) {
          _resultado = {
            "resultado": imcFormatado,
            "mensagem": "Peso ideal (Parabéns)!",
            "color": Colors.green[800],
          };
        } else if (imc >= 25 && imc <= 29.9) {
          _resultado = {
            "resultado": imcFormatado,
            "mensagem": "Levemente acima do peso",
            "color": Colors.blue[800],
          };
        } else if (imc >= 30 && imc <= 34.9) {
          _resultado = {
            "resultado": imcFormatado,
            "mensagem": "Obesidade grau I",
            "color": Colors.orange[600],
          };
        } else if (imc >= 35 && imc <= 39.9) {
          _resultado = {
            "resultado": imcFormatado,
            "mensagem": "Obesidade grau II (Severa)",
            "color": Colors.orange[900],
          };
        } else {
          _resultado = {
            "resultado": imcFormatado,
            "mensagem": "Obesidade grau III (Mórbida)",
            "color": Colors.red[800],
          };
        }
      });
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Calculadora de IMC"),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30, top: 50),
            child: const Image(
              image: AssetImage('images/bmi.png'),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: inputAlturaDecoration,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextField(
                controller: _pesoController,
                keyboardType: TextInputType.number,
                decoration: inputPesoDecoration),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 400,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                calculateIMC();
              },
              child: const Text("Calcular"),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              _resultado["resultado"] != ""
                  ? "IMC: ${_resultado["resultado"]}"
                  : "",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey[700],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            _resultado["mensagem"],
            style: TextStyle(
              fontSize: 30,
              color: _resultado["color"],
              fontWeight: FontWeight.w400,
            ),
          )
        ]));
  }
}
