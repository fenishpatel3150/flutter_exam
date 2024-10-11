import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_exam/helper/helperClass.dart';

class AddItemController extends GetxController {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  var nameController = TextEditingController();
  var quantityController = TextEditingController();
  var selectedCategory = 'General'.obs;
  var isPurchased = false.obs;

  // Add item to the database
  Future<void> addItem(Function onAdd) async {
    if (nameController.text.isEmpty || quantityController.text.isEmpty) return;

    Map<String, dynamic> item = {
      'name': nameController.text,
      'quantity': int.parse(quantityController.text),
      'category': selectedCategory.value,
      'purchased': isPurchased.value,
    };

    await _dbHelper.insertItem(item);
    onAdd();  // Call the onAdd callback after item is added
    Get.back();  // Return to previous screen
  }
}
