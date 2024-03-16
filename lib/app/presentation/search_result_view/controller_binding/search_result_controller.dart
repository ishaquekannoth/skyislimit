import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:skyislimit/app/repositories/models/repo_model.dart';
import 'package:skyislimit/app/repositories/search_results_repo.dart';
import 'package:skyislimit/remote/api_result.dart';

class SearchResultController extends GetxController {
  RxList<RepoModel> gitHubRepos = [RepoModel.dummy()].obs;
  RxBool isLoading = false.obs;

  void fetchRepoForTheUser(BuildContext context,
      {required String userName}) async {
    if (gitHubRepos.first.login == userName) {
      return;
    }
    isLoading.value = true;
    final Result result =
        await SearchResultRepo().fetchTheRepoList(userName: userName);
    isLoading.value = false;
    if (result.isSuccess) {
      gitHubRepos.value = result.successResponse;
    } else {
      Fluttertoast.showToast(msg: result.toString());
    }
  }
}
