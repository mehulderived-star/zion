import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/const_string.dart';
import '../../../BaseViewController/baseController.dart';

import 'package:youtube_player_flutter_plus/youtube_player_flutter_plus.dart';

class HelpAndSupportScreenControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HelpAndSupportScreenController());
  }
}

class HelpAndSupportScreenController extends BaseController {
  //*********************************************************************** */
  // Variable Declaration
  //*********************************************************************** */
  // late YoutubePlayerController youtubeVideoController;
  late YoutubePlayerController youtubeVideoController;
  TextEditingController fromDestincationController = TextEditingController();
  FocusNode fromDestincationFocus = FocusNode();
  TextEditingController toDestincationController = TextEditingController();
  FocusNode toDestincationFocus = FocusNode();
  TextEditingController weightController = TextEditingController();
  FocusNode weightFocus = FocusNode();
  //*********************************************************************** */
  // Functions Declaration
  //*********************************************************************** */
  @override
  void onInit() async {
    super.onInit();
    const url = "https://www.youtube.com/watch?v=CoprgMcVh3Y";
    final videoId = YoutubePlayer.convertUrlToId(url);
    youtubeVideoController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
        isLive: false,
      ),
    );
    update();
  }

  @override
  void dispose() {
    youtubeVideoController.pause();
    youtubeVideoController.dispose();
    super.dispose();
  }

  //*********************************************************************** */
  // Field Validation
  //*********************************************************************** */
}
