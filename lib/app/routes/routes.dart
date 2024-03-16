import 'package:get/get.dart';
import 'package:skyislimit/app/presentation/home_view/controller_binding/home_bindings.dart';
import 'package:skyislimit/app/presentation/home_view/home_view.dart';
import 'package:skyislimit/app/presentation/search_result_view/controller_binding/search_result_binding.dart';
import 'package:skyislimit/app/presentation/search_result_view/search_result_view.dart';

class Routes {
  static const String homeView = '/homeScreenView';
  static const String searchResultView = '/searchResultView';
}

class AppPages {
  static List<GetPage> pages = [
    GetPage(
        name: Routes.homeView,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.searchResultView,
        page: () => const SearchResultViewer(),
        binding: SearchResultBinding()),
  ];
}
