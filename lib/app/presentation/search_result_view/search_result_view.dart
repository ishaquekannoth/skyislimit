import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skyislimit/app/presentation/search_result_view/controller_binding/search_result_controller.dart';
import 'package:skyislimit/app/presentation/search_result_view/widgets/repos_view.dart';
import 'package:skyislimit/app/presentation/search_result_view/widgets/selected_user_widget.dart';
import 'package:skyislimit/app/repositories/models/github_user.dart';
import 'package:skyislimit/app/repositories/models/repo_model.dart';

class SearchResultViewer extends GetView<SearchResultController> {
  const SearchResultViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final GitHubUser user = Get.arguments as GitHubUser;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                onTap: (value) {
                  if (value == 1) {
                    controller.fetchRepoForTheUser(context,
                        userName: user.login);
                  }
                },
                tabs: const [
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.dashboard_customize)),
                ],
              ),
              title: const Text("Search Result"),
            ),
            body: TabBarView(
              children: [
                SelectedUserWidget(user: user),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Obx(
                    () => Column(
                      children: controller.gitHubRepos.length == 1 &&
                              controller.gitHubRepos.first == RepoModel.dummy()
                          ? [
                              SizedBox(
                                height: ScreenUtil().screenHeight * 0.5,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            ]
                          : [
                              ...List.generate(
                                  controller.gitHubRepos.length,
                                  (index) => RepoCard(
                                      onTap: (repoModel) {
                                        log(repoModel.toString());
                                      },
                                      repoModel: controller.gitHubRepos[index],
                                      imageUrl: user.avatarUrl))
                            ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
