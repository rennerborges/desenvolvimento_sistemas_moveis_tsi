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
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, position) {
          Product product = _products[position];
          return ListTile(
            title: Text(
              product.titulo,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            subtitle: Text(product.descricao),
            trailing: Text(
              toReal(product.valor),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          );
        },
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
                  builder: (context) => const CreateProductScreen()));
          setState(() {
            _products.add(product);
          });
        },
      ),
    );
  }
}
