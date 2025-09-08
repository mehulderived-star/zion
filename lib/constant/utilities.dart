import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_picker/country_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_share/flutter_share.dart';
import 'package:share_plus/share_plus.dart';
import 'package:get/get.dart';
import 'package:hl_image_picker/hl_image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../customWidgets/appButton.dart';
import '../main.dart';
import '../navigation/routename.dart';
import 'assets.dart';
import 'color.dart';
import 'constantTextStyle.dart';
import 'font_family.dart';
import 'package:image_picker/image_picker.dart';

final picker = HLImagePicker();
void showWarningToast(String msg) {
  if (!isAccessTokenExpired) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Row(
          children: [
            Icon(Icons.warning, color: AppColors().white100Color),
            const SizedBox(width: 10),
            SizedBox(
              width: 80.w,
              child: Text(
                msg,
                style: TextStyles().drawerTitleText,
                maxLines: 3,
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors().newAppDarkRedColor,
      ),
    );
  }
}

void showErrorToast(String msg) {
  if (!isAccessTokenExpired) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Row(
          children: [
            Icon(Icons.error, color: AppColors().white100Color),
            const SizedBox(width: 10),
            SizedBox(
              width: 80.w,
              child: Text(
                msg,
                style: TextStyles().drawerTitleText,
                maxLines: 3,
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors().newAppDarkRedColor,
      ),
    );
  }
}

void showSuccessToast(String msg) {
  if (!isAccessTokenExpired) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Row(
          children: [
            Icon(Icons.check, color: AppColors().white100Color),
            const SizedBox(width: 10),
            SizedBox(
              width: 80.w,
              child: Text(
                msg,
                style: TextStyles().drawerTitleText,
                maxLines: 3,
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
      ),
    );
  }
}

Future<void> checkPhotoPermission() async {
  try {
    var status = await Permission.photos.request();
    // print(status.isGranted);
    status = await Permission.storage.request();
    // print(status.isGranted);
    status = await Permission.videos.request();
    // print(status.isGranted);
    status = await Permission.audio.request();

    if (androidInfo != null) {
      if (androidInfo!.version.sdkInt >= 28) {
        status = await Permission.manageExternalStorage.request();
      }
    }

    // print(status.isGranted);
  } catch (e) {
    print(e);
  }
}

extension DateTimeExtension on DateTime {
  String timeAgo() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy', 'fr');
    // var tempCurrentDate = formatter.parse("${DateTime.now().toUtc().day}/${DateTime.now().toUtc().month}/${DateTime.now().toUtc().year}");
    Duration diff = DateTime.now().toUtc().difference(toUtc());
    // print(diff.inHours);
    if (diff.inHours < 24) {
      if (diff.inMinutes < 60) {
        return "Il y a ${diff.inMinutes} minute${diff.inMinutes > 1 ? "s" : ""}  ";
      } else {
        return "Il y a ${diff.inHours} heure${diff.inHours > 1 ? "s" : ""} ";
      }
    }
    // if (diff.inHours > 23 && diff.inHours < 48) return "Hier";
    if (diff.inHours >= 23) return formatter.format(this);

    return "";
  }

  String timeAgoInDays() {
    final DateFormat formatter = DateFormat('dd/MM/yyyy', 'fr');
    // var tempCurrentDate = formatter.parse("${DateTime.now().toUtc().day}/${DateTime.now().toUtc().month}/${DateTime.now().toUtc().year}");
    Duration diff = DateTime.now().toUtc().difference(toUtc());
    // print(diff.inHours);
    if (diff.inHours < 24) {
      return "Aujourd'hui";
    }
    if (diff.inHours > 23 && diff.inHours < 48) {
      return "Hier";
    }
    if (diff.inHours >= 48) return formatter.format(this);

    return "";
  }

  String formatDate() {
    final formatter = DateFormat('dd MMMM yyyy', 'fr');
    return formatter.format(this);
  }

  String formatDateInHours() {
    final formatter = DateFormat('hh:mm aa', 'fr');
    return formatter.format(toLocal());
  }

  String formatDateInLong() {
    final DateFormat formatter = DateFormat('dd MMM yyyy, HH:mm', 'fr');
    return formatter.format(this);
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String eventDate(DateTime end) {
    final DateFormat formatter = DateFormat('dd MMMM', 'fr');
    String text = "";
    if (year != end.year) {
      text =
          "Du ${formatter.format(this)} $year au ${formatter.format(end)} ${end.year}";
    } else if (month != end.month) {
      text = "Du ${formatter.format(this)} au ${formatter.format(end)} $year";
    } else {
      text = "Du ${formatter.format(this)} au ${end.day} $year";
    }
    return text;
  }

  int getDifferenceInDaysWithNow() {
    final now = DateTime.now();
    var difference = now.difference(this).inDays;
    if (difference == 0) {
      if (now.day - 1 == day) {
        return 1;
      } else {
        return 0;
      }
    }
    return difference;
  }

  String shortDate() {
    var utcTime = DateTime.utc(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
    final DateFormat formatter = DateFormat('MM/dd/yyyy', 'fr');
    return formatter.format(utcTime);
  }

  String shortTime() {
    var utcTime = DateTime.utc(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
    final DateFormat formatter = DateFormat('hh:mm a', 'fr');
    return formatter.format(utcTime.toLocal());
  }

  DateTime shortFullDateTime() {
    var utcTime = DateTime.utc(
      year,
      month,
      day,
      hour,
      minute,
      second,
      millisecond,
      microsecond,
    );
    // final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return utcTime.toLocal();
  }
}

updateSystemOverlay() {
  SystemChrome.setSystemUIOverlayStyle(getSystemUiOverlayStyle());
}

SystemUiOverlayStyle getSystemUiOverlayStyle() {
  if (Platform.isAndroid) {
    return SystemUiOverlayStyle(
      statusBarColor: AppColors().white100Color,
      statusBarIconBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: AppColors().white100Color,
      systemNavigationBarDividerColor: AppColors().white100Color,
    );
  } else {
    return SystemUiOverlayStyle(
      statusBarColor: AppColors().primary100Color,
      statusBarIconBrightness:
          Platform.isAndroid ? Brightness.light : Brightness.light,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.light : Brightness.light,
      systemNavigationBarColor: AppColors().primary100Color,
      systemNavigationBarDividerColor: AppColors().primary100Color,
    );
  }
}

showPermissionDialog({
  String? message,
  String? acceptButtonTitle,
  String? rejectButtonTitle,
  Function? yesClick,
  Function? noclick,
}) {
  showDialog<String>(
    context: Get.context!,
    builder:
        (BuildContext context) => AlertDialog(
          titlePadding: EdgeInsets.zero,
          backgroundColor: AppColors().white100Color,
          surfaceTintColor: AppColors().white100Color,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 16,
            left: 20,
            right: 20,
          ),
          // title: Container(
          //   //color: Colors.red,
          //   // width: 100.w,
          //   padding:  EdgeInsets.only(right: 60, left: 50),
          //   margin:  EdgeInsets.symmetric(vertical: 20),
          //   child: Image.asset(
          //     AppImages.logoNameImage,
          //     width: 30.w,
          //   ),
          // ),
          content: Padding(
            padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
            child: Text(
              message!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: AppColors().gray100Color,
                fontFamily: Appfonts.family2Medium,
              ),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: const EdgeInsets.only(bottom: 25),
          actions: <Widget>[
            Container(
              width: 32.w,
              height: 40,
              // color: AppColors().extralightGrayThemeColor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors().gray40Color, width: 1),
                color: AppColors().gray20Color,
              ),
              child: TextButton(
                // style: ButtonStyle(

                //   foregroundColor:
                //       MaterialStateProperty.all<Color>(
                //           AppColors().blackThemeColor),
                // ),
                onPressed: () {
                  if (noclick == null) {
                    Get.back();
                  } else {
                    noclick();
                  }
                },
                child: Text(
                  'No',
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 14,
                    color: AppColors().gray100Color,
                  ),
                ),
              ),
            ),
            Container(
              width: 32.w,
              height: 40,
              // color: AppColors().extralightGrayThemeColor,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors().gray40Color, width: 1),
                color: AppColors().gray100Color,
              ),
              child: TextButton(
                onPressed: () {
                  if (yesClick == null) {
                    Get.back();
                  } else {
                    yesClick();
                  }
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    fontFamily: Appfonts.family2Medium,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
  );
}

Future<void> openActionSheetForSingleImagePick(Function callBack) {
  return showCupertinoModalPopup<void>(
    context: Get.context!,
    builder:
        (BuildContext context) => CupertinoActionSheet(
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              /// This parameter indicates the action would be a default
              /// defualt behavior, turns the action's text to bold text.
              isDefaultAction: true,
              onPressed: () async {
                try {
                  final XFile? pickedFile = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                    imageQuality: 25,
                  );
                  if (pickedFile != null) {
                    callBack(File(pickedFile.path));
                  }
                } catch (e) {
                  print(e);
                }
                Get.back();
              },
              child: const Text('Camera'),
            ),
            CupertinoActionSheetAction(
              onPressed: () async {
                try {
                  final XFile? pickedFile = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 25,
                  );
                  if (pickedFile != null) {
                    callBack(File(pickedFile.path));
                  }
                } catch (e) {
                  print(e);
                }
                Get.back();
              },
              child: Text('Gallery'.tr),
            ),
            CupertinoActionSheetAction(
              /// This parameter indicates the action would perform
              /// a destructive action such as delete or exit and turns
              /// the action's text color to red.
              isDestructiveAction: true,
              onPressed: () {
                Get.back();
              },
              child: Text('Cancel'.tr),
            ),
          ],
        ),
  );
}

Widget countryListDropDown() {
  List<String> staticItems = ['1', '2', '3', '4', '5'];
  String? selectedItem;

  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        width: 100.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: AppColors().white100Color,
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 6), // ▼ pushes shadow 6 px downward
              blurRadius: 8, // softness
              spreadRadius: -2, // pulls it in a bit (keeps sides clean)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    '-- Select Country --',
                    style: TextStyle(
                      fontFamily: Appfonts.family2Regular,
                      fontSize: 17,
                      color: AppColors().newGrey66Color,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              items:
                  staticItems
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                item,
                                style: TextStyle(
                                  fontFamily: Appfonts.family1Bold,
                                  fontSize: 15,
                                  color: AppColors().gray100Color,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
              value: selectedItem,
              onChanged: (value) {
                setState(() {
                  selectedItem = value;
                });
                // Perform additional logic here
              },
              iconStyleData: IconStyleData(
                icon: Image.asset(
                  AppImages.arrowDownBlack,
                  width: 15,
                  height: 15,
                ),
              ),
              buttonStyleData: ButtonStyleData(
                height: 42,
                width: 100.w,
                padding: const EdgeInsets.only(left: 14, right: 2),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 82.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: WidgetStateProperty.all(6),
                  thumbVisibility: WidgetStateProperty.all(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ),
        ),
      );
    },
  );
}

// Future<void> openActionSheetForMedia(Function callBack, RxBool isFileLoading) {
//   return showCupertinoModalPopup<void>(
//     context: Get.context!,
//     builder: (BuildContext context) => CupertinoActionSheet(
//       actions: <CupertinoActionSheetAction>[
//         CupertinoActionSheetAction(
//           onPressed: () async {
//             Get.back();
//             try {
//               isFileLoading.value = true;
//               final XFile? pickedFile = await ImagePicker().pickVideo(
//                 source: ImageSource.camera,
//               );
//               if (pickedFile != null) {
//                 var info = await FFprobeKit.getMediaInformation(pickedFile.path);
//                 MediaInformation? properties = info.getMediaInformation();
//                 Map<dynamic, dynamic>? details = properties?.getAllProperties();
//                 List<dynamic> strems = details["streams"];
//                 Map<dynamic, dynamic>? item = strems[0];
//                 print(item!["codec_name"]);
//                 print("=================================");
//                 if (item["codec_name"] == "h264") {
//                   callBack(File(pickedFile.path));
//                 } else {
//                   showErrorToast("video codec is not supported.");
//                 }
//                 // Get.back();
//                 // if ((await File(pickedFile.path).length() / 1000000) > 300) {
//                 //   callBack(null);
//                 //   showErrorToast(
//                 //       "The file you have chosen is too large to upload. Please select a file with a size of less than 300 MB.");
//                 // } else {
//                 // var newPath = await copyToLocal(File(pickedFile.path));
//                 // Get.toNamed(RouterName.trimmerScreen, arguments: {
//                 //   "Picked": newPath,
//                 //   "onSave": (String path) {
//                 //     callBack(File(path));
//                 //   },
//                 //   "onCancel": () {
//                 //     callBack(null);
//                 //   }
//                 // });
//                 // }
//               }
//             } catch (e) {
//               print(e);
//             }
//           },
//           child: Text('Video from Camera'.tr),
//         ),
//         CupertinoActionSheetAction(
//           onPressed: () async {
//             Get.back();
//             isFileLoading.value = true;
//             try {
//               final XFile? pickedFile = await ImagePicker().pickVideo(
//                 source: ImageSource.gallery,
//               );
//               if (pickedFile != null) {
//                 var info = await FFprobeKit.getMediaInformation(pickedFile.path);
//                 MediaInformation? properties = info.getMediaInformation();
//                 Map<dynamic, dynamic>? details = properties?.getAllProperties();
//                 List<dynamic> strems = details["streams"];
//                 Map<dynamic, dynamic>? item = strems[0];
//                 Map<dynamic, dynamic>? item2 = strems[1];
//                 var codec = "";
//                 if (item != null) {
//                   if (item["codec_type"] == "video") {
//                     codec = item["codec_name"];
//                   }
//                 }
//                 if (item2 != null) {
//                   if (item2["codec_type"] == "video") {
//                     codec = item2["codec_name"];
//                   }
//                 }
//                 print(codec);
//                 if (codec == "h264") {
//                   callBack(File(pickedFile.path));
//                 } else {
//                   showErrorToast("video codec is not supported.");
//                 }
//                 //this will print all data
//                 // print(pickedFile.path.split(".").last.toLowerCase());
//                 // print("======================================");
//                 // if (pickedFile.path.split(".").last.toLowerCase() == "mp4" ||
//                 //     (pickedFile.path.split(".").last.toLowerCase() == "mov" &&
//                 //         Platform.isIOS) ||
//                 //     pickedFile.path.split(".").last.toLowerCase() == "avi") {
//                 //   // if ((await File(pickedFile.path).length() / 1000000) > 300) {
//                 //   //   callBack(null);
//                 //   //   showErrorToast(
//                 //   //       "The file you have chosen is too large to upload. Please select a file with a size of less than 300 MB.");
//                 //   // } else {
//                 //   var newPath = await copyToLocal(File(pickedFile.path));
//                   // Get.toNamed(RouterName.trimmerScreen, arguments: {
//                   //   "Picked": newPath,
//                   //   "onSave": (String path) {
//                   //     callBack(File(path));
//                   //   },
//                   //   "onCancel": () {
//                   //     callBack(null);
//                   //   }
//                   // });
//                 //   // }
//                 // } else {
//                 //   callBack(null);
//                 //   showErrorToast("The video file format is not compatible.");
//                 // }
//               } else {
//                 callBack(null);
//               }
//             } catch (e) {
//               print(e);
//             }
//           },
//           child: Text('Video from Gallery'.tr),
//         ),
//         CupertinoActionSheetAction(
//           /// This parameter indicates the action would perform
//           /// a destructive action such as delete or exit and turns
//           /// the action's text color to red.
//           isDestructiveAction: true,
//           onPressed: () {
//             Get.back();
//             isFileLoading.value = false;
//           },
//           child: Text('Cancel'.tr),
//         ),
//       ],
//     ),
//   );
// }

// Future<void> openActionSheetForDoc(Function callBack) async {
//   try {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf'],
//     );

//     if (result != null) {
//       var newPath = await copyToLocal(File(result.files.single.path!));
//       callBack(File(newPath!));
//     }
//   } catch (e) {
//     print(e);
//     showErrorToast("you may not have a proper app for viewing this content");
//     return;
//   }
// }

Future<String?> copyToLocal(File original) async {
  try {
    final Directory tempDir = await getTemporaryDirectory();
    var retuenFileName =
        "${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.${original.path.split(".").last}";
    var newFile = File(retuenFileName);
    await newFile.writeAsBytes(await original.readAsBytes());
    return retuenFileName;
  } catch (e) {
    print(e);
    return "";
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

hideKeyboard({BuildContext? context}) {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  // FocusScope.of(context ?? Get.context!).requestFocus(FocusNode());
}

Widget mainTabHeader() {
  return const Row(
    children: [
      // Image.asset(
      //   AppImages.logoMain,
      //   width: 35.w,
      //   // height: 5.h,
      // ),
      Spacer(),
      // GestureDetector(
      //   onTap: () {
      //     Get.toNamed(RouterName.notificationListScreen);
      //   },
      //   child: Image.asset(
      //     AppImages.notificationIcon,
      //     width: 25,
      //     height: 25,
      //   ),
      // ),
      SizedBox(width: 20),
    ],
  );
}

showBottomsheetDeleteDialog(
  String title,
  String message, {
  String? yesTxt,
  String? noTxt,
  Function? onYesTap,
  Function? onNoTap,
  RxBool? isLodading,
}) {
  Get.bottomSheet(
    SizedBox(
      height: 35.h,
      child: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(color: Colors.transparent),
            ),
          ),
          Container(
            height: 35.h,
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              color: AppColors().white100Color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5.w),
                topRight: Radius.circular(5.w),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 1.h),
                Center(
                  child: Container(
                    width: 10.w,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors().switchOffColor,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 19.sp,
                    fontFamily: Appfonts.family1Bold,
                    color: AppColors().accentRedColor,
                  ),
                ),
                SizedBox(height: 2.h),
                Divider(color: AppColors().switchOffColor),
                SizedBox(height: 2.h),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 18.sp,
                    fontFamily: Appfonts.family1Bold,
                    color: AppColors().textColor,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        isEnabled: true,
                        title: noTxt ?? "Cancel".tr,
                        onPress: () {
                          if (onNoTap != null) {
                            onNoTap();
                          } else {
                            Get.back();
                          }
                        },
                        bgColor: AppColors().gray100Color,
                        isFilled: true,
                        textColor: AppColors().white100Color,
                        isTextCenter: true,
                        isLoading: false,
                        shimmerColor: AppColors().white100Color,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Expanded(
                      child:
                          isLodading != null
                              ? Obx(
                                () => CustomButton(
                                  isEnabled: true,
                                  title: "${yesTxt ?? title}".tr,
                                  onPress: () {
                                    if (onYesTap != null) {
                                      onYesTap();
                                    } else {
                                      Get.back();
                                    }
                                  },
                                  bgColor: AppColors().gray100Color,
                                  isFilled: true,
                                  textColor: AppColors().white100Color,
                                  isTextCenter: true,
                                  isLoading: isLodading.value,
                                  shimmerColor: AppColors().white100Color,
                                ),
                              )
                              : CustomButton(
                                isEnabled: true,
                                title: "Oui, ${yesTxt ?? title}".tr,
                                onPress: () {
                                  if (onYesTap != null) {
                                    onYesTap();
                                  } else {
                                    Get.back();
                                  }
                                },
                                bgColor: AppColors().primary100Color,
                                isFilled: true,
                                textColor: AppColors().white100Color,
                                isTextCenter: true,
                                isLoading: false,
                                shimmerColor: AppColors().white100Color,
                              ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

showCalenderBottomsheeStarttDialog(
  String? title,
  DateTime startdate,
  DateTime endtdate,
  Function callBack,
) {
  DateTime date = DateTime.now();
  Get.bottomSheet(
    SizedBox(
      height: Platform.isAndroid ? 41.h : 45.h,
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(color: Colors.transparent),
              ),
              Container(
                height: Platform.isAndroid ? 41.h : 45.h,
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: AppColors().white100Color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.w),
                    topRight: Radius.circular(5.w),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    Center(
                      child: Container(
                        width: 10.w,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors().switchOffColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      title ?? "",
                      style: TextStyle(
                        height: 1.75,
                        letterSpacing: 0.2,
                        fontSize: 18.sp,
                        fontFamily: Appfonts.family1Bold,
                        color: AppColors().text3Color,
                      ),
                    ),

                    SizedBox(
                      height: 25.h,
                      width: 100.w,
                      child: CupertinoDatePicker(
                        initialDateTime: startdate,
                        minimumDate:
                            startdate.isAfter(DateTime.now())
                                ? DateTime.now()
                                : startdate,
                        maximumDate:
                            endtdate.difference(startdate).inMinutes != 0
                                ? endtdate
                                : null,
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newDateTime) {
                          setState(() => date = newDateTime);
                        },
                      ),
                    ),
                    SizedBox(height: 1.h),
                    CustomButton(
                      isEnabled: true,
                      title: "Fixer la date ",
                      onPress: () {
                        Get.back();
                        callBack(date);
                      },
                      bgColor: AppColors().primary100Color,
                      isFilled: true,
                      textColor: AppColors().white100Color,
                      isTextCenter: true,
                      isLoading: false,
                      shimmerColor: AppColors().white100Color,
                    ),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

showCalenderBottomsheeEndtDialog(
  String? title,
  DateTime startdate,
  DateTime endtdate,
  Function callBack,
) {
  DateTime date = DateTime.now();
  Get.bottomSheet(
    SizedBox(
      height: Platform.isAndroid ? 41.h : 45.h,
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(color: Colors.transparent),
              ),
              Container(
                height: Platform.isAndroid ? 41.h : 45.h,
                width: 100.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: AppColors().white100Color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.w),
                    topRight: Radius.circular(5.w),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 1.h),
                    Center(
                      child: Container(
                        width: 10.w,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors().switchOffColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    Text(
                      title ?? "",
                      style: TextStyle(
                        height: 1.75,
                        letterSpacing: 0.2,
                        fontSize: 18.sp,
                        fontFamily: Appfonts.family1Bold,
                        color: AppColors().text3Color,
                      ),
                    ),

                    SizedBox(
                      height: 25.h,
                      width: 100.w,
                      child: CupertinoDatePicker(
                        initialDateTime:
                            endtdate.difference(DateTime.now()).inSeconds > 0
                                ? endtdate
                                : DateTime.now(),
                        minimumDate: startdate.add(const Duration(minutes: 1)),
                        maximumDate: null,
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newDateTime) {
                          setState(() => date = newDateTime);
                        },
                      ),
                    ),
                    SizedBox(height: 1.h),
                    CustomButton(
                      isEnabled: true,
                      title: "Fixer la date ",
                      onPress: () {
                        Get.back();
                        callBack(date);
                      },
                      bgColor: AppColors().primary100Color,
                      isFilled: true,
                      textColor: AppColors().white100Color,
                      isTextCenter: true,
                      isLoading: false,
                      shimmerColor: AppColors().white100Color,
                    ),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

showDocumentBottomsheetDialog(
  String? title,
  int type,
  String attachtitle,
  String description,
  String attachFile,
  Function callback, {
  List<HLPickerItem>? selectedImages,
}) {
  TextEditingController userNameController = TextEditingController(
    text: attachtitle,
  );
  FocusNode userNameFocus = FocusNode();
  TextEditingController descriptionController = TextEditingController(
    text: description,
  );
  FocusNode descriptionFocus = FocusNode();
  RxBool isFileLoading = false.obs;
  File? file;
  List<HLPickerItem> selectedLocalImages = [];
  if (attachFile.isNotEmpty && attachFile != 'null') {
    file = File(attachFile);
  }
  if (selectedImages != null) {
    selectedLocalImages.addAll(selectedImages);
  }
  Get.bottomSheet(
    StatefulBuilder(
      builder: (context, setState) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(isFileLoading.isFalse);
          },
          child: SizedBox(
            height:
                type == 3
                    ? file == null
                        ? 30.h
                        : 40.h
                    : selectedLocalImages.isNotEmpty
                    ? 40.h
                    : file == null
                    ? 30.h
                    : 40.h,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(color: Colors.transparent),
                ),
                Container(
                  height:
                      type == 3
                          ? file == null
                              ? 30.h
                              : 40.h
                          : selectedLocalImages.isNotEmpty
                          ? 40.h
                          : file == null
                          ? 30.h
                          : 40.h,
                  width: 100.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: AppColors().white100Color,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.w),
                      topRight: Radius.circular(5.w),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 1.h),
                      Center(
                        child: Container(
                          width: 10.w,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColors().switchOffColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.5.h),
                      Center(
                        child: Text(
                          title ?? "",
                          style: TextStyle(
                            height: 1.75,
                            letterSpacing: 0.2,
                            fontSize: 18.sp,
                            fontFamily: Appfonts.family1Bold,
                            color: AppColors().text3Color,
                          ),
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      // if (type != 3)
                      //   Text(
                      //     "Title".tr,
                      //     style: TextStyle(
                      //         height: 1.75,
                      //         letterSpacing: 0.2,
                      //         fontSize: 18,
                      //         fontFamily: Appfonts.family1SemiBold,
                      //         color: AppColors().text3Color),
                      //   ),
                      // if (type != 3)
                      //   SizedBox(
                      //     height: 1.h,
                      //   ),
                      // if (type != 3)
                      //   CustomTextField(
                      //     type: "Your title".tr,
                      //     keyBoardType: TextInputType.text,
                      //     isEnabled: true,
                      //     isOptional: false,
                      //     inValidMsg: "",
                      //     placeHolderMsg: "Your title".tr,
                      //     labelMsg: "Your title".tr,
                      //     emptyFieldMsg: "",
                      //     controller: userNameController,
                      //     focus: userNameFocus,
                      //     isSecure: false,
                      //     keyboardButtonType: TextInputAction.next,
                      //     maxLength: 100,
                      //   ),

                      // SizedBox(
                      //   height: 2.5.h,
                      // ),
                      // if (type != 3)
                      //   Text(
                      //     "Description",
                      //     style: TextStyle(
                      //         height: 1.75,
                      //         letterSpacing: 0.2,
                      //         fontSize: 18,
                      //         fontFamily: Appfonts.family1SemiBold,
                      //         color: AppColors().text3Color),
                      //   ),
                      // if (type != 3)
                      //   SizedBox(
                      //     height: 1.h,
                      //   ),
                      // if (type != 3)
                      //   CustomTextField(
                      //     type: 'Votre description',
                      //     keyBoardType: TextInputType.text,
                      //     isEnabled: true,
                      //     isOptional: false,
                      //     inValidMsg: "",
                      //     placeHolderMsg: "Votre description",
                      //     labelMsg: "Votre description",
                      //     emptyFieldMsg: "",
                      //     controller: descriptionController,
                      //     focus: descriptionFocus,
                      //     isSecure: false,
                      //     keyboardButtonType: TextInputAction.done,
                      //     maxLength: 10000,
                      //     isMaxlineMore: true,
                      //     maxLine: 4,
                      //     minLine: 4,
                      //   ),
                      SizedBox(height: 3.h),
                      GestureDetector(
                        onTap: () async {
                          hideKeyboard(context: context);
                          switch (type) {
                            case 1:
                              {
                                // openActionSheetForDoc((File f) {
                                //   isFileLoading.value = true;
                                //   setState(() {});
                                //   if ((f.lengthSync() / 1000000) > 20) {
                                //     isFileLoading.value = false;
                                //     setState(() {});
                                //     showErrorToast(
                                //         "The file you have chosen is too large to upload. Please select a file with a size of less than 20 MB.");
                                //   } else {
                                //     file = f;
                                //     isFileLoading.value = false;
                                //     setState(() {});
                                //   }
                                // });
                                break;
                              }
                            case 2:
                              {
                                await openPicker(selectedLocalImages);
                                setState(() {});
                                break;
                              }
                            case 3:
                              {
                                setState(() {});
                                // openActionSheetForMedia((File? f) {
                                //   setState(() {});
                                //   // if (f == null) {
                                //   //   isFileLoading.value = false;
                                //   //   setState(() {});
                                //   //   return;
                                //   // }
                                //   // if ((f!.lengthSync() / 1000000) > 300) {
                                //   //   showErrorToast("Video too big please try another video");
                                //   //   isFileLoading.value = false;
                                //   // } else {
                                //   file = f;
                                //   isFileLoading.value = false;
                                //   // }
                                //   setState(() {});
                                // }, isFileLoading);
                                break;
                              }
                          }
                        },
                        child: Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (file != null)
                                SizedBox(
                                  width: 45.w,
                                  child: Text(
                                    file != null
                                        ? file.path.split("/").last
                                        : "",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      height: 1.5,
                                      fontSize: 15.sp,
                                      fontFamily: Appfonts.family1Bold,
                                      overflow: TextOverflow.ellipsis,
                                      color:
                                          file != null
                                              ? AppColors().greenColor
                                              : AppColors().primary100Color,
                                    ),
                                  ),
                                ),
                              if (file != null) const Spacer(),
                              if (isFileLoading.value)
                                Container(
                                  height: 5.w,
                                  width: 5.w,
                                  margin: EdgeInsets.only(right: 5.w),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 1,
                                    color: AppColors().primary100Color,
                                  ),
                                ),
                              Text(
                                file != null
                                    ? "fichier sélectionné".toUpperCase()
                                    : "Select file".tr.toUpperCase(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 15.sp,
                                  fontFamily: Appfonts.family1Bold,
                                  color:
                                      file != null
                                          ? AppColors().greenColor
                                          : AppColors().primary100Color,
                                ),
                              ),
                              SizedBox(width: 1.w),
                              Image.asset(
                                file != null
                                    ? AppImages.arrowBack
                                    : AppImages.arrowBack,
                                height: file != null ? 20 : 12,
                                width: file != null ? 20 : 12,
                              ),
                            ],
                          );
                        }),
                      ),
                      if (selectedLocalImages.isNotEmpty)
                        SizedBox(
                          height: 10.h,
                          width: 100.w,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const ClampingScrollPhysics(),
                            itemCount: selectedLocalImages.length,
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 30.w,
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 15,
                                      ),
                                      child:
                                          selectedLocalImages[index].path
                                                  .contains("http")
                                              ? CachedNetworkImage(
                                                imageUrl:
                                                    selectedLocalImages[index]
                                                        .path ??
                                                    "",
                                                height: 10.h,
                                                width: 10.h,
                                                fit: BoxFit.cover,
                                                progressIndicatorBuilder: (
                                                  context,
                                                  url,
                                                  progress,
                                                ) {
                                                  return SizedBox(
                                                    height: 56,
                                                    width: 56,
                                                    child: Center(
                                                      child: SizedBox(
                                                        height: 50,
                                                        width: 50,
                                                        child: CircularProgressIndicator(
                                                          strokeWidth: 1,
                                                          value:
                                                              progress.progress,
                                                          color:
                                                              AppColors()
                                                                  .primary100Color,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                errorWidget: (
                                                  context,
                                                  url,
                                                  error,
                                                ) {
                                                  return SizedBox(
                                                    height: 56,
                                                    width: 56,
                                                    child: Center(
                                                      child: Icon(
                                                        Icons.error,
                                                        color:
                                                            AppColors().Grey600,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                              : Image.file(
                                                height: 10.h,
                                                width: 10.h,
                                                File(
                                                  selectedLocalImages[index]
                                                      .path,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                    ),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            if (selectedImages?.indexWhere(
                                                  (element) =>
                                                      selectedLocalImages[index]
                                                          .id ==
                                                      element.id,
                                                ) !=
                                                -1) {
                                              if (int.tryParse(
                                                    selectedLocalImages[index]
                                                        .id,
                                                  ) !=
                                                  null) {
                                                // Get.find<createArticleController>().callDeletePostImage(selectedLocalImages[index].id);
                                              }
                                              selectedImages!.remove(
                                                selectedLocalImages[index],
                                              );
                                            }
                                            selectedLocalImages.remove(
                                              selectedLocalImages[index],
                                            );

                                            setState(() {});
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Icon(
                                              Icons.delete,
                                              color: AppColors().accentRedColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      if (file != null && !attachFile.contains("http"))
                        SizedBox(height: 3.h),
                      if (file != null && !attachFile.contains("http"))
                        CustomButton(
                          isEnabled: true,
                          title: "DELETE".tr,
                          onPress: () {
                            callback("", "", null);
                            Get.back();
                          },
                          bgColor: AppColors().accentRedColor,
                          isFilled: true,
                          textColor: AppColors().white100Color,
                          isTextCenter: true,
                          isLoading: false,
                          shimmerColor: AppColors().white100Color,
                        ),
                      SizedBox(height: 3.h),

                      CustomButton(
                        isEnabled: true,
                        title: "Validate".tr,
                        onPress: () {
                          hideKeyboard(context: context);
                          // if (userNameController.text.isEmpty && type != 3) {
                          //   showWarningToast("Please enter title.".tr);
                          // } else if (descriptionController.text.isEmpty &&
                          //     type != 3) {
                          //   showWarningToast("Please enter description.".tr);
                          // } else
                          if (file == null && selectedLocalImages.isEmpty) {
                            showWarningToast(
                              "Please select the attachment file.".tr,
                            );
                          } else {
                            if (selectedImages != null) {
                              for (var element in selectedLocalImages) {
                                selectedImages.addIf(
                                  selectedImages.indexWhere(
                                        (image) => element.id == image.id,
                                      ) ==
                                      -1,
                                  element,
                                );
                              }
                            }
                            callback(
                              userNameController.text,
                              descriptionController.text,
                              file,
                            );

                            if (type != 3) {
                              Get.back();
                            }
                          }
                        },
                        bgColor: AppColors().primary100Color,
                        isFilled: true,
                        textColor: AppColors().white100Color,
                        isTextCenter: true,
                        isLoading: false,
                        shimmerColor: AppColors().white100Color,
                      ),
                      // SizedBox(
                      //   height: 5.h,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
    isDismissible: true,
    isScrollControlled: true,
    enableDrag: true,
  );
}

Future<void> openPicker(List<HLPickerItem> selectedImages) async {
  try {
    final images = await picker.openPicker(
      cropping: false,
      selectedIds: selectedImages.map((e) => e.id).toList(),
      pickerOptions: const HLPickerOptions(
        mediaType: MediaType.image,
        enablePreview: false,
        isExportThumbnail: true,
        thumbnailCompressFormat: CompressFormat.jpg,
        thumbnailCompressQuality: 0.9,
        maxSelectedAssets: 10,
        usedCameraButton: false,
        numberOfColumn: 3,
        isGif: false,
        maxFileSize: (20 * 1024),
      ),
      localized: LocalizedImagePicker(
        doneText: "Select file".tr,
        maxFileSizeErrorText: "Image too big please try another image".tr,
        defaultAlbumName: "Recent".tr,
        maxSelectedAssetsErrorText:
            "You can choose a maximum of 10 images to attach to the post.".tr,
        okText: "okay".tr,
      ),
    );

    for (var element in images) {
      selectedImages.addIf(
        selectedImages.indexWhere((image) => element.id == image.id) == -1,
        element,
      );
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}

Future<void> share(String? title, String? text) async {
  await Share.share(
    text ?? '', // Text content to share
    subject: title ?? '', // Title or subject of the share
  );
}
