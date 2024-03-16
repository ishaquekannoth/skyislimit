import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skyislimit/app/presentation/home_view/controller_binding/home_bindings.dart';
import 'package:skyislimit/app/presentation/home_view/home_view.dart';
import 'package:skyislimit/app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.4, 890.3),
      child: GetMaterialApp(
        getPages: AppPages.pages,
        initialRoute: Routes.homeView,
        onUnknownRoute: (settings) => GetPageRoute(
            routeName: Routes.homeView,
            page: () => const HomeView(),
            binding: HomeBinding()),
        debugShowCheckedModeBanner: false,
        title: 'Sky is Limit',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
