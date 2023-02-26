import 'package:time_picker/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<ProductModel>?> getProduct() async {
    var response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/"));
    if (response.statusCode == 200) {
      var responseData = response.body;
      print('Response ---${response.body}');
      return productModelFromJson(responseData);
    } else {
      Exception('Something went wrong');
    }
    return null;
  }
}
