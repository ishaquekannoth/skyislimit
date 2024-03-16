import 'package:get/get.dart';
import 'package:skyislimit/app/presentation/home_view/controller_binding/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
