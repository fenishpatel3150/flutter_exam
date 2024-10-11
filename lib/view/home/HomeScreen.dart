import 'package:flutter/material.dart';
import 'package:flutter_exam/controller/HomeController.dart';
import 'package:flutter_exam/view/edit/AddScreen.dart';
import 'package:flutter_exam/view/edit/EditScreen.dart';
import 'package:get/get.dart';
class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xfff83758),
        onPressed: () {
          Get.to(() => AddItemScreen(onAdd: controller.fetchItems));  },
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xfff83758),
        title: Text('Shopping List', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.items.isEmpty) {
                return Center(child: Text('No items available.'));
              }

              return ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  final item = controller.items[index];
                  return ListTile(
                    title: Text(item['name']),
                    subtitle: Text('${item['quantity']} - ${item['category']}'),
                    onTap: () {
                      Get.to(() => EditItemScreen(item: item, onUpdate: controller.fetchItems));
                    },
                    onLongPress: () => controller.deleteItem(item['id']),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
