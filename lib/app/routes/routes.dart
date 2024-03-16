import 'package:get/get.dart';
import 'package:skyislimit/app/presentation/home_view/controller_binding/home_bindings.dart';
import 'package:skyislimit/app/presentation/home_view/home_view.dart';

class Routes {
  static const String homeView = '/homeScreenView';
}

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.homeView,
      page: () => const HomeView(),
      binding: HomeBinding()
    ),
  ];
}
