import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_exam/helper/helperClass.dart';

class EditItemController extends GetxController {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  late TextEditingController nameController;
  late TextEditingController quantityController;
  RxString selectedCategory = ''.obs;
  RxBool isPurchased = false.obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    quantityController = TextEditingController();
  }

  void initialize(Map<String, dynamic> item) {
    nameController.text = item['name'];
    quantityController.text = item['quantity'].toString();
    selectedCategory.value = item['category'];
    isPurchased.value = item['purchased'] == 1; // Ensure it's a bool
  }

  Future<void> updateItem(Map<String, dynamic> item) async {
    Map<String, dynamic> updatedItem = {
      'id': item['id'],
      'name': nameController.text,
      'quantity': int.parse(quantityController.text),
      'category': selectedCategory.value,
      'purchased': isPurchased.value ? 1 : 0, // Store it back as int
    };

    await _dbHelper.updateItem(updatedItem);
    // Notify listeners or sync with Firebase if necessary
  }

  @override
  void onClose() {
    nameController.dispose();
    quantityController.dispose();
    super.onClose();
  }
}
