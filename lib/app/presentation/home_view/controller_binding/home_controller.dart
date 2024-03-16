import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:skyislimit/app/repositories/home_repo.dart';
import 'package:skyislimit/app/repositories/models/github_user.dart';
import 'package:skyislimit/remote/api_result.dart';

class HomeController extends GetxController {
  Rx<GitHubUser> gitHubUser = GitHubUser.dummy().obs;
  RxBool isLoading = false.obs;
  Timer? _debounceTimer;

  void fireTheSearch(BuildContext context, {required String key}) {
    if (key.trim().isEmpty) {
      gitHubUser.value = GitHubUser.dummy();
      return;
    }

    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 100), () async {
      isLoading.value = true;
      final Result result =
          await HomeRepo().fireTheSearch(searchQuery: key.trim());
      isLoading.value = false;
      if (result.isSuccess) {
        gitHubUser.value = result.successResponse;
      } else {
        log(result.toString());
        Fluttertoast.showToast(msg: result.toString());
      }
    });
  }
}
