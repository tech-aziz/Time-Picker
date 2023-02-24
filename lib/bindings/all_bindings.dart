import 'package:get/get.dart';
import 'package:time_picker/controller/product_controller.dart';

class AllBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }

}