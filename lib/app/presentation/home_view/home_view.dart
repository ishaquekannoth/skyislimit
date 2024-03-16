import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:skyislimit/app/presentation/home_view/controller_binding/home_controller.dart';
import 'package:skyislimit/app/presentation/home_view/widgets/result_card.dart';
import 'package:skyislimit/app/presentation/home_view/widgets/search_with_result.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomSearchBar(
        onSuggestionSelection: (object) {},
        onTextFieldChange: (object) {
          log(object.toString());
          controller.fireTheSearch(key: object.trim().toString(), context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => controller.isLoading.value
                ? SizedBox(
                    height: 400.h,
                    width: ScreenUtil().screenWidth,
                    child: const Center(child: CircularProgressIndicator()))
                : ResultCard(user: controller.gitHubUser.value))
          ],
        ),
      ),
    ));
  }
}
