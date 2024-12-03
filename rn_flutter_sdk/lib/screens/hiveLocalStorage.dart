import 'package:flutter/material.dart';

import 'package:rn_flutter_sdk/models/_hive_model_.dart';
import 'package:rn_flutter_sdk/models/source/_database_expose_.dart';
import 'package:rn_flutter_sdk/widgets/_add_widget_.dart';
import 'package:rn_flutter_sdk/widgets/_list_widget_.dart';

class HiveLocalStoragePage extends StatefulWidget {
  const HiveLocalStoragePage({Key? key}) : super(key: key);

  @override
  State<HiveLocalStoragePage> createState() => _HiveLocalStoragePageState();
}

class _HiveLocalStoragePageState extends State<HiveLocalStoragePage> {
  final databaseSource = DatabaseSource();

  DataModel? dataModel;

  void setModel(DataModel model) {
    setState(() {
      dataModel = model;
    });
  }

  @override
  void initState() {
    super.initState();
    databaseSource.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            AddWidget(
              dataModel: dataModel,
              onAdd: databaseSource.saveData,
            ),
            const Divider(
              thickness: 2,
              color: Colors.indigoAccent,
            ),
            Expanded(
              child: ListWidget(
                dataListNotifier: databaseSource.dataListNotifier,
                onDelete: databaseSource.deleteData,
                onUpdate: setModel,
              ),
            )
          ],
        ),
      ),
    );
  }
}
