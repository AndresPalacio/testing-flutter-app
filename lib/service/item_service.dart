import 'package:flutter_app_testing_dojo/data/databasehelper.dart';
import 'package:flutter_app_testing_dojo/model/item.dart';
import 'package:flutter_app_testing_dojo/repository/item_repository.dart';
import 'package:sqflite/sqflite.dart';

class ItemService implements ItemRepository{

  @override
  Future<String> insertItem(Item item) async {
    print(item);
    final Database db = await DatabaseHelper.instance.database;

    await db.insert(
      Item.TABLENAME,
      item.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await DatabaseHelper.instance.database;
    return await db.rawQuery('SELECT * FROM items ORDER BY id DESC');
  }


}