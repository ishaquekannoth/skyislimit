import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:skyislimit/app/utilities/utils.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  CustomSearchBar(
      {super.key,
      this.suggestions,
      this.onSuggestionSelection,
      this.onSearchSubmit,
      this.onTextFieldChange});
  final ValueNotifier<bool> showCloseButton = ValueNotifier(false);
  final ValueNotifier<List<String>>? suggestions;
  final WidgetDataOutFunction<String> onSuggestionSelection;
  final WidgetDataOutFunction<String> onSearchSubmit;
  final WidgetDataOutFunction<String> onTextFieldChange;
  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      debounceDuration: Durations.extralong4,
      constraints: BoxConstraints(maxHeight: 300.h),
      hideOnEmpty: true,
      itemBuilder: (context, value) {
        return value.isNotEmpty
            ? Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 16.h, left: 16.w, bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 16.w,
                        width: 16.w,
                        child: const Icon(Icons.search)),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      value,
                    )
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
      onSelected: onSuggestionSelection,
      builder: (context, controller, focusNode) {
        return Container(
          color: AppPaintings.deepPurple,
          height: 56.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: TextField(
            textAlign: TextAlign.center,
            cursorColor: AppPaintings.appBlack,
            controller: controller,
            focusNode: focusNode,
            onSubmitted: onSearchSubmit,
            onChanged: (value) {
              showCloseButton.value = value.isNotEmpty;
              if (onTextFieldChange != null) {
                return onTextFieldChange!(value);
              }
            },
            maxLines: 1,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                hintText: "Search for users here...",
                suffixIcon: ValueListenableBuilder(
                  valueListenable: showCloseButton,
                  builder: (context, __, ___) => controller.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            controller.clear();
                            showCloseButton.value = false;
                            suggestions?.value.clear();
                          },
                          icon: Icon(
                            Icons.close,
                            size: 20.h,
                          ))
                      : const SizedBox.shrink(),
                ),
                filled: true,
                fillColor: AppPaintings.appWhite,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 6.w)),
          ),
        );
      },
      suggestionsCallback: (search) {
        return suggestions != null
            ? List.generate(
                suggestions!.value.length > 5 ? 5 : suggestions!.value.length,
                (index) => suggestions!.value[index])
            : [];
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
