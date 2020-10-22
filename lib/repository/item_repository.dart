import 'package:flutter_app_testing_dojo/model/item.dart';
abstract class ItemRepository {
  Future<String> insertItem(Item item);
  Future<List<Map<String, dynamic>>> queryAll();
}
