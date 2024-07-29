import 'package:get/get.dart';
import 'package:store_with_mvc/model/product.dart';
import 'package:store_with_mvc/service/serviceController.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    try {
      isLoading(true);
      var products = await RemoteService.fetchProduct();
      productList.value = products;
    } finally {
      isLoading(false);
    }
  }
}
