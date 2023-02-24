import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:time_picker/model/product_model.dart';

class Dbhelper {
  static Database? _database;

  Future<Database?> get db async {

    if (_database != null) {
      return _database;
    } else {
      _database = await initialDatabase();
      return _database;
    }
  }

 Future<Database> initialDatabase() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    var openDB = openDatabase(documentDirectory.path, version: 1, onCreate: _onCreate);
    return openDB;
  }

 _onCreate(Database db, int version) async {
      await db.execute(
          '''
          CREATE TABLE product(
          id INTEGER PRIMARY KEY,
          title TEXT,
          price INTEGER,
          description TEXT,
          dateTime TEXT
          )
          '''
      );
  }

  Future insertProductData(ProductModel productModel) async{
    Database? database = await db;
    return await database?.insert("product", productModel.toJson());
  }


  Future<List<ProductModel>?> getProductModel()async {
    Database? database = await db;
    var data = await database!.query("product", orderBy: "id",);
    List<ProductModel> productModel = data.map((e) => ProductModel.fromJson(e)).toList();
    return productModel;


  }

}


