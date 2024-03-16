import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skyislimit/app/repositories/models/repo_model.dart';
import 'package:skyislimit/app/utilities/utils.dart';

class AERepoCard extends StatelessWidget {
  final RepoModel repoModel;
  final bool? rightPadding;
  final String imageUrl;
  final void Function(RepoModel repoModel)? onTap;
  const AERepoCard(
      {super.key,
      required this.repoModel,
      this.rightPadding = false,
      this.onTap,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!(repoModel) : null,
      child: Container(
        height: 173.h,
        width: 317.w,
        margin: EdgeInsets.only(left: 16.w, right: rightPadding! ? 16.w : 0),
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
        decoration: BoxDecoration(
            color: AppPaintings.appWhite,
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(repoModel.name,
                        maxLines: 1,
                        style: AppPaintings.commonStyle.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppPaintings.appBlack.withOpacity(0.9))),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(repoModel.description,
                        maxLines: 1,
                        style: AppPaintings.commonStyle.copyWith(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppPaintings.appBlack.withOpacity(0.8))),
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(top: 6.h),
                      child: Row(
                        children: [Text(repoModel.visibilty)],
                      ),
                    )
                  ],
                ),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.network(
                    imageUrl,
                    height: 100.h,
                    width: 100.h,
                    errorBuilder: (context, error, stackTrace) {
                      return SizedBox(
                          height: 100.h,
                          width: 100.h,
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
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              )));
                    },
                    fit: BoxFit.fill,
                  ))
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 54.h,
            width: 279.w,
            child: Text(repoModel.description,
                textAlign: TextAlign.left,
                maxLines: 3,
                style: AppPaintings.commonStyle.copyWith(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                    color: AppPaintings.deepPurple)),
          )
        ]),
      ),
    );
  }
}
