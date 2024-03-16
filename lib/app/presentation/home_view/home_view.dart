import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:skyislimit/app/presentation/home_view/widgets/search_with_result.dart';

class HomeView extends StatelessWidget {
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
      ),
    ));
  }
}
