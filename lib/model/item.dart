import 'package:flutter_app_testing_dojo/data/databasehelper.dart';
import 'package:sqflite/sqflite.dart';

class Item {
   int id;
   String name;
   int cost;
  static const String TABLENAME = "items";

  Item({this.id,this.name, this.cost});

  Item.fromScreen({String name,int cost}){
    this.name = name;
    this.cost = cost;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    map['id'] = this.id;
    map['name'] = this.name;
    map['cost'] = this.cost;

    return map;
  }



}
