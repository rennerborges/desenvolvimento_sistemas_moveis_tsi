import 'dart:io';

class Product {
  int? id;
  late String titulo;
  late String descricao;
  late double valor;
  File? image;

  Product(this.titulo, this.descricao, this.valor, this.image, [this.id]);

  Product.fromMap(Map map) {
    id = map['id'];
    titulo = map['titulo'];
    descricao = map['descricao'];
    valor = double.parse(map['valor']);
    image = map['image'] != '' ? File(map['image']) : null;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'valor': valor,
      'image': image != null ? image!.path : '',
    };

    return map;
  }
}
