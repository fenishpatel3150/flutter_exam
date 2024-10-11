import 'package:flutter/material.dart';
import 'package:flutter_exam/controller/EdithItemController.dart';
import 'package:get/get.dart';
import 'package:flutter_exam/helper/helperClass.dart';
class EditItemScreen extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function onUpdate;

  EditItemScreen({required this.item, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    final EditItemController controller = Get.put(EditItemController());
    controller.initialize(item);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff83758),
        onPressed: () async {
          await controller.updateItem(item);
          onUpdate();  Get.back();
        },
        child: Icon(Icons.done, color: Colors.white),
      ),
      appBar: AppBar(
          backgroundColor: Color(0xfff83758),
          title: Text('Edit Item',style: TextStyle(color: Colors.white))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.nameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            TextField(
              controller: controller.quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}
