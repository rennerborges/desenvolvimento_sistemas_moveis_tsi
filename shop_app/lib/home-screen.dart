import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/product-helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'product.dart';
import 'create-product-screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _products = List<Product>.empty(growable: true);
  String toReal(double money) {
    return NumberFormat.simpleCurrency(
      name: 'BRL',
    ).format(money / 100);
  }

  final ProductHelper _helper = ProductHelper();

  @override
  void initState() {
    super.initState();

    _helper.getAll().then((data) {
      setState(() {
        if (data != null) _products = data;
      });
    });
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Shopee",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: const Text(
                "Produtos",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ),
            _products.isEmpty
                ? Column(
                    children: [
                      const SizedBox(
                          width: 250,
                          child: Image(
                            image: AssetImage(
                                'images/ilustracao-do-conceito-vazio.webp'),
                          )),
                      Center(
                        child: Text(
                          'Nenhum produto cadastrado!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.grey[600]!,
                          ),
                        ),
                      ),
                    ],
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      shrinkWrap: true,
                      itemCount: _products.length,
                      itemBuilder: (context, position) {
                        Product product = _products[position];
                        return Dismissible(
                          key: Key(product.titulo),
                          background: Container(
                            color: Colors.green,
                            child: const Align(
                              alignment: Alignment(-0.9, 0.0),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          secondaryBackground: Container(
                            color: Colors.red,
                            child: const Align(
                              alignment: Alignment(0.9, 0.0),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          confirmDismiss: ((direction) async {
                            if (direction == DismissDirection.startToEnd) {
                              Product? editedProduct = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateProductScreen(
                                    product: product,
                                  ),
                                ),
                              );

                              if (editedProduct != null) {
                                int? result =
                                    await _helper.editProduct(editedProduct);

                                if (result == 0) return false;

                                setState(() {
                                  _products.removeAt(position);
                                  _products.insert(position, editedProduct);

                                  const snackBar = SnackBar(
                                    content:
                                        Text('Produto editado com sucesso!'),
                                    backgroundColor: Colors.green,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                });
                              }

                              return false;
                            }

                            if (direction == DismissDirection.endToStart) {
                              int? result =
                                  await _helper.deleteProduct(product);

                              if (result == 0) return false;

                              setState(() {
                                _products.removeAt(position);

                                const snackBar = SnackBar(
                                  content: Text('Produto apagado com sucesso!'),
                                  backgroundColor: Colors.red,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              });

                              return true;
                            }
                          }),
                          child: GestureDetector(
                              child: Container(
                                clipBehavior: Clip.hardEdge,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Image.file(
                                            product.image!,
                                            alignment: Alignment.center,
                                            fit: BoxFit.cover,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        product.titulo,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Colors.grey[900]!,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      product.descricao,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.grey[600]!,
                                      ),
                                    ),
                                    Text(
                                      toReal(product.valor),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                        color: Colors.orange[900]!,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onLongPress: () async {
                                showBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              ListTile(
                                                leading:
                                                    const Icon(Icons.email),
                                                title: const Text(
                                                    'Enviar por e-mail'),
                                                onTap: () async {
                                                  Navigator.pop(context);

                                                  final Uri uri = Uri(
                                                    scheme: 'mailto',
                                                    path:
                                                        'rennerferreira23@gmail.com',
                                                    query:
                                                        encodeQueryParameters(<
                                                            String, String>{
                                                      'subject':
                                                          'Olhe esse produto ${product.titulo} por apenas ${toReal(product.valor)} que encontrei na Shopee do Renner!',
                                                    }),
                                                  );

                                                  if (!await launchUrl(uri)) {
                                                    throw 'Could not launch $uri';
                                                  }

                                                  await launchUrl(uri);
                                                },
                                              ),
                                              ListTile(
                                                leading: const Icon(Icons.sms),
                                                title: const Text(
                                                    'Enviar por SMS'),
                                                onTap: () async {
                                                  Navigator.pop(context);

                                                  final Uri uri = Uri(
                                                    scheme: 'sms',
                                                    path: '+5564992954946',
                                                    query:
                                                        encodeQueryParameters(
                                                      <String, String>{
                                                        'body':
                                                            'Olhe esse produto ${product.titulo} por apenas ${toReal(product.valor)} que encontrei na Shopee do Renner!',
                                                      },
                                                    ),
                                                  );

                                                  if (!await launchUrl(uri)) {
                                                    throw 'Could not launch $uri';
                                                  }

                                                  await launchUrl(uri);
                                                },
                                              ),
                                              ListTile(
                                                leading:
                                                    const Icon(Icons.whatsapp),
                                                title: const Text(
                                                    'Enviar por Whatsapp'),
                                                onTap: () async {
                                                  Navigator.pop(context);

                                                  final Uri uri = Uri(
                                                    scheme: 'https',
                                                    path:
                                                        'api.whatsapp.com/send',
                                                    query:
                                                        encodeQueryParameters(
                                                      <String, String>{
                                                        'text':
                                                            'Olhe esse produto ${product.titulo} por apenas ${toReal(product.valor)} que encontrei na Shopee do Renner!',
                                                      },
                                                    ),
                                                  );

                                                  try {
                                                    await launchUrl(uri,
                                                        mode: LaunchMode
                                                            .externalApplication);
                                                  } catch (e) {
                                                    print(e);
                                                  }
                                                },
                                              ),
                                              ListTile(
                                                leading: Icon(
                                                  Icons
                                                      .keyboard_backspace_sharp,
                                                  color: Colors.red[600],
                                                ),
                                                title: Text(
                                                  'Voltar',
                                                  style: TextStyle(
                                                    color: Colors.red[600],
                                                  ),
                                                ),
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          ));
                                    });
                              }),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          Product product = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateProductScreen(),
            ),
          );

          Product? savedProduct = await _helper.saveProduct(product);

          if (savedProduct == null) return;

          setState(() {
            _products.add(product);
            const snackBar = SnackBar(
              content: Text('Produto criado com sucesso!'),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        },
      ),
    );
  }
}
