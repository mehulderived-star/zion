import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/assets.dart';
import '../constant/color.dart';
import '../constant/font_family.dart';

// ignore_for_file: must_be_immutable
class chatNavigationBar extends AppBar {
  chatNavigationBar({
    Key? key,
    this.scaffoldKey,
    this.headerTitle,
    this.isBackDisplay,
    this.isTrailingDisplay,
    this.isForEdit,
    this.isForShare,
    this.onDrawerButtonPress,
    this.onTrailingButtonPress,
    this.onBackButtonPress,
    this.centerIcon,
    this.backGroundColor,
    this.trailingIcon,
  }) : super(key: key);
  GlobalKey<ScaffoldState>? scaffoldKey;
  String? headerTitle;
  bool? isBackDisplay;
  bool? isTrailingDisplay;
  bool? isForEdit;
  bool? isForShare;
  Widget? centerIcon;
  Function? onDrawerButtonPress;
  Function? onBackButtonPress;
  Function? onTrailingButtonPress;
  Color? backGroundColor;
  Widget? trailingIcon;

  @override
  State<chatNavigationBar> createState() => _chatNavigationBar();
}

class _chatNavigationBar extends State<chatNavigationBar> {
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: widget.backGroundColor ?? AppColors().white100Color,
        foregroundColor: widget.backGroundColor ?? AppColors().white100Color,
        flexibleSpace: Container(
            color: widget.backGroundColor ?? AppColors().white100Color),
        leading: Container(
            height: 24.sp,
            width: 24.sp,
            child: widget.isBackDisplay != null
                ? IconButton(
                    //Menu Icon Start
                    onPressed: () {
                      if (widget.isBackDisplay == false) {
                        widget.onBackButtonPress!();
                      } else if (widget.isBackDisplay != null) {
                        // Get.back();
                        widget.onBackButtonPress!();
                      } else {
                        widget.onBackButtonPress!();
                      }
                    },
                    icon: widget.isBackDisplay != null
                        ? Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Image.asset(
                              AppImages.arrowBack,
                            ),
                          )
                        : Image.asset(
                            AppImages.arrowBack,
                            width: 24,
                            color: AppColors().gray100Color,
                          ),
                  )
                : null),
        title: Row(
          children: [
            // ClipOval(
            //   child: CachedNetworkImage(
            //     imageUrl: widget.userData?.profilePicture ?? "",
            //     fit: BoxFit.cover,
            //     placeholder: (context, url) => CircularProgressIndicator(
            //       color: AppColors().primary100Color,
            //     ),
            //     errorWidget: (context, url, error) => Image.asset(
            //       AppImages.userDefaultImage,
            //       fit: BoxFit.cover,
            //       width: 40,
            //       height: 40,
            //     ),
            //     height: 40,
            //     width: 40,
            //   ),
            // ),
            SizedBox(
              width: 10,
            ),
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text(widget.userData?.userName ?? "",
            //         style: TextStyle(
            //             fontSize: 16,
            //             fontFamily: Appfonts.family1Medium,
            //             color: AppColors().gray100Color)),
            //     // Text("Online",
            //     //     style: TextStyle(fontSize: 12, fontFamily: Appfonts.family1Medium, color: AppColors().primary100Color)),
            //   ],
            // )
          ],
        ),
        actions: [
          widget.isTrailingDisplay != null
              ? widget.trailingIcon != null
                  ? Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: IconButton(
                        onPressed: () async {
                          widget.onTrailingButtonPress!();
                        },
                        icon: widget.trailingIcon!,
                      ),
                    )
                  : SizedBox(
                      width: 15.w,
                    )
              : SizedBox(
                  width: 15.w,
                ),
        ]);
  }
}
