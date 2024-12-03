import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:rn_flutter_sdk/models/_hive_model_.dart';

class DatabaseSource {
  ValueNotifier<List<DataModel>> dataListNotifier = ValueNotifier([]);

  Future<Box<DataModel>> get _database => Hive.openBox<DataModel>('app_db');

  Future<void> saveData(DataModel model, dynamic key) async {
    if (key == null) {
      _addData(model);
      return;
    }
    _updateData(model, key);
    getAllData();
  }

  Future<void> getAllData() async {
    final database = await _database;
    dataListNotifier.value = database.values.toList();
  }

  Future<void> deleteData(int id) async {
    final database = await _database;
    database.delete(id);
    getAllData();
  }

  Future<void> _addData(DataModel model) async {
    final database = await _database;
    await database.add(model);
    getAllData();
  }

  Future<void> _updateData(DataModel model, dynamic key) async {
    final database = await _database;
    database.put(key, model);
  }
}
