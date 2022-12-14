import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'product.dart';

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
  File? _image = null;

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
        _image = widget.product!.image;
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

      Product? newProduct;
      if (widget.product == null) {
        newProduct = Product(titulo, descricao, preco, _image);
      } else {
        newProduct =
            Product(titulo, descricao, preco, _image, widget.product!.id);
      }
      Navigator.pop(context, newProduct);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.product != null ? "Editar produto" : "Criar produto",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Informa????es do produto",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.grey[600]!,
                    ),
                  ),
                ),
                GestureDetector(
                  child: Expanded(
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      height: 160,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          width: 1,
                          color: Colors.grey[400]!,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: _image == null
                          ? const Icon(
                              Icons.add_a_photo,
                              size: 30,
                            )
                          : Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.file(
                                  _image!,
                                  alignment: Alignment.center,
                                  fit: BoxFit.cover,
                                )
                              ],
                            ),
                    ),
                  ),
                  onTap: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? pickedFile =
                        await picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      File image = File(pickedFile.path);
                      Directory directory =
                          await getApplicationDocumentsDirectory();
                      String _localPath = directory.path;

                      String uniqueID = UniqueKey().toString();

                      final File savedImage =
                          await image.copy('$_localPath/image_$uniqueID.png');

                      setState(() {
                        _image = savedImage;
                      });
                    }
                  },
                ),
                TextFormField(
                  controller: _tituloController,
                  decoration: InputDecoration(
                    labelText: "T??tulo",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
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
                    errorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Preenchimento obrigat??rio";
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _descricaoController,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Descri????o",
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
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Preenchimento obrigat??rio";
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
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixText: "R\$: ",
                      labelText: "Pre??o",
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
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
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
                        return "Preenchimento obrigat??rio";
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
