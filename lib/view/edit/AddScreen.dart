import 'package:flutter/material.dart';
import 'package:flutter_exam/controller/AddItemController.dart';
import 'package:get/get.dart';
class AddItemScreen extends StatelessWidget {
  final Function onAdd;  final AddItemController controller = Get.put(AddItemController()); // Initialize controller

  AddItemScreen({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff83758),
        onPressed: () => controller.addItem(onAdd),
        child: Icon(Icons.done, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xfff83758),
        title: Text('Add Item', style: TextStyle(color: Colors.white)),
      ),
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
