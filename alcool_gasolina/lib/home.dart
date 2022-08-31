import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _alcoolController = TextEditingController();
  TextEditingController _gasolinaController = TextEditingController();
  String _resultado = '';

  @override
  Widget build(BuildContext context) {
    var inputGasolinaDecoration = const InputDecoration(
      label: Text("Valor Gasolina"),
      prefix: Text("R\$ "),
    );

    var inputAlcoolDecoration = const InputDecoration(
      label: Text("Valor alcool"),
      prefix: Text("R\$ "),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text("Álcool x Gasolina"),
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  _alcoolController.clear();
                  _gasolinaController.clear();
                  setState(() {
                    _resultado = '';
                  });
                },
                icon: const Icon(Icons.refresh))
          ]),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 30, top: 50),
                child: const Image(
                  image: AssetImage('images/gas.png'),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: _gasolinaController,
                  keyboardType: TextInputType.number,
                  decoration: inputGasolinaDecoration,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: TextField(
                  controller: _alcoolController,
                  keyboardType: TextInputType.number,
                  decoration: inputAlcoolDecoration,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70, bottom: 50),
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    double vAlcool =
                        double.parse(_alcoolController.text.toString());
                    double vGas =
                        double.parse(_gasolinaController.text.toString());

                    double resultado = vAlcool / vGas;

                    setState(() {
                      _resultado =
                          resultado < 0.7 ? "Vá de alcool" : "Gasosa meu chapa";
                    });
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.orange),
                  child: const Text("Calcular"),
                ),
              ),
              Text(
                _resultado,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue[900],
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
