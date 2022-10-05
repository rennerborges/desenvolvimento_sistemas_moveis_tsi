import 'dart:io';

class Product {
  late String titulo;
  late String descricao;
  late double valor;
  File? image;

  Product(this.titulo, this.descricao, this.valor, this.image);
}
