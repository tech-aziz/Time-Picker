import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:time_picker/model/product_model.dart';
import 'package:time_picker/services/api_call.dart';

class ProductController extends GetxController {
  var loader = false.obs;
  var allProductList = RxList<ProductModel>().obs;
  final ProductRepository _productRepository = ProductRepository();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    loader.value = true;
    var apiData = await _productRepository.getProduct();
    if (apiData != null) {
      allProductList.value.addAll(apiData);
      loader.value = false;
    }
  }
}
