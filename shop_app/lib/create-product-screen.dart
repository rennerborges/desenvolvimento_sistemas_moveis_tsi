import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Product.dart';

class CreateProductScreen extends StatefulWidget {
  Product? product;

  CreateProductScreen({super.key, this.product});

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState();
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  String toReal(String money) {
    double preco = double.parse(money);
    return NumberFormat("#,##0.00", "pt_BR").format(preco / 100);
  }

  @override
  void initState() {
    super.initState();

    if (widget.product != null) {
      setState(() {
        _tituloController.text = widget.product!.titulo;
        _descricaoController.text = widget.product!.descricao;
        _precoController.text = toReal(widget.product!.valor.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    createProduct() {
      String titulo = _tituloController.text;
      String descricao = _descricaoController.text;
      double preco = double.parse(
          _precoController.text.toString().replaceAll(RegExp(r'[.,]'), ''));

      Product newProduct = Product(titulo, descricao, preco);
      Navigator.pop(context, newProduct);
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          widget.product != null ? "Editar produto" : "Criar produto",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: _tituloController,
                  decoration: InputDecoration(
                    labelText: "Título",
                    labelStyle: const TextStyle(fontSize: 18),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey[600]!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Preenchimento obrigatório";
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _descricaoController,
                    decoration: InputDecoration(
                      labelText: "Descrição",
                      labelStyle: const TextStyle(fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey[600]!,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Preenchimento obrigatório";
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _precoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: "R\$: ",
                      labelText: "Preço",
                      labelStyle: const TextStyle(fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey[600]!,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    onChanged: (string) {
                      string = toReal(string.replaceAll(RegExp(r'[.,]'), ''));
                      _precoController.value = TextEditingValue(
                        text: string,
                        selection:
                            TextSelection.collapsed(offset: string.length),
                      );
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Preenchimento obrigatório";
                      }
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 45,
                          margin: const EdgeInsets.only(top: 20, right: 10),
                          child: ElevatedButton.icon(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            icon: const Icon(Icons.arrow_back),
                            label: const Text(
                              "Cancelar",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                    ),
                    Expanded(
                      child: Container(
                          height: 45,
                          margin: const EdgeInsets.only(top: 20, left: 10),
                          child: ElevatedButton.icon(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            icon: const Icon(Icons.check),
                            label: const Text(
                              "Cadastrar",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                createProduct();
                              }
                            },
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
