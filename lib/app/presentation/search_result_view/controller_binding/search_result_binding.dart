import 'package:get/get.dart';
import 'package:skyislimit/app/presentation/search_result_view/controller_binding/search_result_controller.dart';

class SearchResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchResultController());
  }
}
