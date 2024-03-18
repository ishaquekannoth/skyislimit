import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:skyislimit/app/presentation/search_result_view/widgets/repos_view.dart';
import 'package:skyislimit/app/presentation/search_result_view/widgets/selected_user_widget.dart';
import 'package:skyislimit/app/repositories/models/github_user.dart';
import 'package:skyislimit/app/repositories/models/repo_model.dart';
import 'package:skyislimit/app/utilities/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controller_binding/search_result_controller.dart';

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
                    if (user.publicRepos == 0) {
                      return;
                    }
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
                user.publicRepos == 0
                    ? SizedBox(
                        height: ScreenUtil().screenHeight / 2,
                        width: ScreenUtil().screenWidth,
                        child: Center(
                          child: Text(
                            "There are No public repos for this user",
                            overflow: TextOverflow.ellipsis,
                            style: AppPaintings.commonStyle,
                            maxLines: 2,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Obx(
                          () => Column(
                              children: controller.gitHubRepos.length != 1 &&
                                      controller.gitHubRepos.first !=
                                          RepoModel.dummy()
                                  ? List.generate(
                                      controller.gitHubRepos.length,
                                      (index) => RepoCard(
                                          onTap: (repoModel) {
                                            try {
                                              launchUrl(
                                                  Uri.parse(repoModel.htmlUrl));
                                            } catch (e) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Something went wrong..");
                                            }
                                          },
                                          repoModel:
                                              controller.gitHubRepos[index],
                                          imageUrl: user.avatarUrl))
                                  : List.generate(
                                      1,
                                      (index) => SizedBox(
                                            height:
                                                ScreenUtil().screenHeight * 0.5,
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ))),
                        ),
                      ),
              ],
            )));
  }
}
