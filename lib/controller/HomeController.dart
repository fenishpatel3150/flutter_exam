import 'package:get/get.dart';
import 'package:flutter_exam/helper/helperClass.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  var items = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  Future<void> fetchItems() async {
    var fetchedItems = await _dbHelper.fetchItems();
    items.assignAll(fetchedItems);
  }


  Future<void> deleteItem(int id) async {
    await _dbHelper.deleteItem(id);
    await FirebaseFirestore.instance.collection('items').doc(id.toString()).delete();
    fetchItems();
    Get.snackbar('Success', 'Item deleted successfully');
  }

  Future<void> updateItem(Map<String, dynamic> item) async {
    await _dbHelper.updateItem(item);
    fetchItems();
  }
}
