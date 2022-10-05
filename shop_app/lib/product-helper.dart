import 'package:shop_app/database-helper.dart';
import 'package:shop_app/product.dart';
import 'package:sqflite/sqflite.dart';

class ProductHelper {
  static const String tableName = 'products';
  static const String idColumn = 'id';
  static const String tituloColumn = 'titulo';
  static const String descricaoColumn = 'descricao';
  static const String valorColumn = 'valor';
  static const String imageColumn = 'image';

  static String get createScript {
    return "CREATE TABLE $tableName($idColumn INTEGER PRIMARY KEY AUTOINCREMENT," +
        "$tituloColumn TEXT NOT NULL, $descricaoColumn TEXT NOT NULL, $valorColumn TEXT NOT NULL,  $imageColumn STRING);";
  }

  Future<Product?> saveProduct(Product product) async {
    Database? db = await DatabaseHelper().db;

    if (db == null) {
      return null;
    }

    product.id = await db.insert(tableName, product.toMap());
    return product;
  }

  Future<List<Product>?> getAll() async {
    Database? db = await DatabaseHelper().db;

    if (db == null) {
      return null;
    }

    List<Map> returnedProducts = await db.query(tableName, columns: [
      idColumn,
      tituloColumn,
      descricaoColumn,
      valorColumn,
      imageColumn
    ]);

    List<Product> products = List.empty(growable: true);

    for (Map product in returnedProducts) {
      products.add(Product.fromMap(product));
    }

    return products;
  }

  Future<int?> editProduct(Product product) async {
    Database? db = await DatabaseHelper().db;

    if (db == null) {
      return null;
    }

    return await db.update(
      tableName,
      product.toMap(),
      where: "$idColumn = ?",
      whereArgs: [product.id],
    );
  }

  Future<int?> deleteProduct(Product product) async {
    Database? db = await DatabaseHelper().db;

    if (db == null) {
      return null;
    }

    return await db.delete(
      tableName,
      where: "$idColumn = ?",
      whereArgs: [product.id],
    );
  }
}
