import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_picker/controller/product_controller.dart';

class ApiCall extends GetView<ProductController> {
  const ApiCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Call'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.loader.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
              shrinkWrap: true,
              primary: false,
              separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                    color: Colors.blue,
                  ),
              itemCount: controller.allProductList.value.length,
              itemBuilder: (context, index) {
                var data = controller.allProductList.value[index];
                return Card(
                  elevation: 12,
                  child: ListTile(
                    leading: Text("${data.userId}"),
                    title: Text("${data.title}"),
                    subtitle: Text("${data.id}"),
                    trailing: Text("${data.completed}"),
                  ),
                );
              });
        }
      }),
    );
  }
}
