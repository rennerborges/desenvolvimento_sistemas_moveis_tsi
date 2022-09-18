import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Product.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          "Shopee",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
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
          ListView.builder(
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
                onDismissed: ((direction) async {
                  if (direction == DismissDirection.endToStart) {
                    setState(() {
                      _products.removeAt(position);
                    });
                  }
                }),
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
                      setState(() {
                        _products.removeAt(position);
                        _products.insert(position, editedProduct);
                      });
                    }

                    return false;
                  }

                  setState(() {
                    _products.removeAt(position);
                  });
                  return true;
                }),
                child: ListTile(
                  title: Text(
                    product.titulo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.grey[600]!,
                    ),
                  ),
                  subtitle: Text(product.descricao),
                  trailing: Text(
                    toReal(product.valor),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.green,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
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
          setState(() {
            _products.add(product);
          });
        },
      ),
    );
  }
}
