import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:skyislimit/app/repositories/home_repo.dart';
import 'package:skyislimit/app/repositories/models/github_user.dart';
import 'package:skyislimit/remote/api_result.dart';

class HomeController extends GetxController {
  Rx<GitHubUser> gitHubUser = GitHubUser.fromJson(json: {}).obs;
  Timer? _debounceTimer;

  void fireSearch(BuildContext context, {required String key}) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(const Duration(seconds: 1), () async {
      final Result result = await HomeRepo().fireTheSearch(searchQuery: key);
      if (result.isSuccess) {
        gitHubUser.value = result.successResponse;
        log(gitHubUser.value.toString());
      } else {
        Fluttertoast.showToast(msg: result.toString());
      }
    });
  }
}
