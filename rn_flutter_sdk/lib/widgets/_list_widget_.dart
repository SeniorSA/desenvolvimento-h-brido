import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:rn_flutter_sdk/models/_hive_model_.dart';

class ListWidget extends StatelessWidget {
  final ValueListenable<List<DataModel>> dataListNotifier;
  final Function(int) onDelete;
  final Function(DataModel) onUpdate;

  const ListWidget({
    Key? key,
    required this.dataListNotifier,
    required this.onDelete,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dataListNotifier,
      builder: (_, dataModelList, child) {
        return ListView.separated(
          itemBuilder: (_, index) {
            var dataModel = dataModelList[index];
            return ListTile(
              title: Text(dataModel.name),
              subtitle: Text(dataModel.age),
              trailing: FittedBox(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => onUpdate(dataModel),
                      icon: const Icon(
                        Icons.edit,
                      ),
                    ),
                    IconButton(
                      onPressed: () => onDelete(dataModel.key),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (_, index) {
            return const Divider();
          },
          itemCount: dataModelList.length,
        );
      },
    );
  }
}
