import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyislimit/app/presentation/home_view/controller_binding/home_controller.dart';
import 'package:skyislimit/app/presentation/home_view/widgets/search_with_result.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomSearchBar(
        onSuggestionSelection: (object) {},
        onSearchSubmit: (object) {
          log(object.toString());
        },
        onTextFieldChange: (object) {
          controller.fireSearch(key: object, context);
        },
      ),
    ));
  }
}
