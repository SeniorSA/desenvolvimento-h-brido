import 'package:flutter/material.dart';
import 'package:rn_flutter_sdk/models/_hive_model_.dart';

class AddWidget extends StatefulWidget {
  final DataModel? dataModel;
  final Function(DataModel, dynamic) onAdd;

  const AddWidget({
    Key? key,
    required this.dataModel,
    required this.onAdd,
  }) : super(key: key);

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  void onAddData() {
    FocusManager.instance.primaryFocus?.unfocus();
    var name = nameController.text;
    var age = ageController.text;
    if (name.isEmpty || age.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }
    final dataModel = DataModel(
      name: name.trim(),
      age: age.trim(),
    );
    widget.onAdd(dataModel, widget.dataModel?.key);
    nameController.clear();
    ageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.dataModel != null) {
      nameController.text = widget.dataModel!.name;
      ageController.text = widget.dataModel!.age;
    }
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Name",
            ),
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 10),
          TextField(
            controller: ageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Age",
            ),
            keyboardType: TextInputType.number,
            onEditingComplete: onAddData,
          ),
          const SizedBox(height: 10),
          FilledButton.icon(
            onPressed: onAddData,
            icon: const Icon(Icons.add),
            label: const Text("Add"),
            style: const ButtonStyle(elevation: MaterialStatePropertyAll(4)),
          )
        ],
      ),
    );
  }
}
