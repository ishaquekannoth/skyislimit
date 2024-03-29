import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skyislimit/app/repositories/models/github_user.dart';
import 'package:skyislimit/app/utilities/utils.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key, required this.user, this.onTap});
  final GitHubUser user;
  final WidgetDataOutFunction<GitHubUser> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!(user) : null,
      child: Container(
          margin: EdgeInsets.all(10.h),
          height: 300.h,
          width: ScreenUtil().screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.h),
                decoration: BoxDecoration(
                    border: Border.all(color: AppPaintings.deepPurple)),
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
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Login ID:  ${user.login}",
                style: AppPaintings.commonStyle,
              ),
              Text(
                "Name:  ${user.name}",
                style: AppPaintings.commonStyle,
              )
            ],
          )),
    );
  }
}
