import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyislimit/app/presentation/search_result_view/widgets/selected_user_widget.dart';
import 'package:skyislimit/app/repositories/models/github_user.dart';
import 'package:skyislimit/app/repositories/search_results_repo.dart';

class SearchResultViewer extends StatelessWidget {
  const SearchResultViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final GitHubUser user = Get.arguments as GitHubUser;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.person)),
                  Tab(icon: Icon(Icons.dashboard_customize)),
                ],
              ),
              title: const Text("Search Result"),
            ),
            body: TabBarView(
              children: [
                SelectedUserWidget(user: user),
                IconButton(
                    onPressed: () async {
                      var result = await SearchResultRepo()
                          .fetchTheRepoList(userName: user.login);
                      log(result.successResponse.first.toString());
                    },
                    icon: const Icon(Icons.directions_transit)),
              ],
            )));
  }
}
