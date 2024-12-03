import 'package:hive_flutter/adapters.dart';

part '_hive_model_.g.dart';

@HiveType(typeId: 1)
class DataModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String age;

  DataModel({required this.name, required this.age});

  @override
  String toString() {
    return "DataModel(name:$name,age:$age)";
  }
}
