import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skyislimit/app/repositories/models/github_user.dart';
import 'package:skyislimit/app/utilities/utils.dart';

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
                const Icon(Icons.directions_transit),
              ],
            )));
  }
}

class SelectedUserWidget extends StatelessWidget {
  const SelectedUserWidget({
    super.key,
    required this.user,
  });

  final GitHubUser user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h),
      margin: EdgeInsets.all(10.h),
      width: ScreenUtil().screenWidth,
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              user.avatarUrl,
              height: 200.h,
              width: 200.h,
              errorBuilder: (context, error, stackTrace) {
                return SizedBox(
                    height: 200.h,
                    width: 200.h,
                    child: const Center(child: Icon(Icons.error)));
              },
              loadingBuilder: (context, child, loadingProgress) {
                return loadingProgress == null
                    ? child
                    : SizedBox(
                        height: 50.h,
                        width: 50.h,
                        child: Center(
                            child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        )));
              },
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Text(
                    maxLines: 25,
                    user.toString(),
                    textAlign: TextAlign.center,
                    style: AppPaintings.commonStyle,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

