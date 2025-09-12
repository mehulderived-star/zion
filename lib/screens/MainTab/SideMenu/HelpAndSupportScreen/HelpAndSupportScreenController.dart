import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zion_app/modelClass/tutorialModel.dart';
import 'package:zion_app/service/network/api.dart';
import 'package:zion_app/service/network/apiService.dart';
import 'package:zion_app/service/network/apiServices.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../constant/assets.dart';
import '../../../../../constant/const_string.dart';
import '../../../BaseViewController/baseController.dart';

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
  TextEditingController fromDestincationController = TextEditingController();
  FocusNode fromDestincationFocus = FocusNode();
  TextEditingController toDestincationController = TextEditingController();
  FocusNode toDestincationFocus = FocusNode();
  TextEditingController weightController = TextEditingController();
  FocusNode weightFocus = FocusNode();

  final tutorials = <TutorialModel>[].obs;
  final currentlyPlayingIndex = Rx<int?>(null);
  final controllers = <int, YoutubePlayerController>{}.obs;
  final ApiServices apiService = ApiServices();

  //*********************************************************************** */
  // Functions Declaration
  //*********************************************************************** */
  @override
  void onInit() async {
    super.onInit();
    fetchTutorials();
  }

  @override
  void onClose() {
    // Dispose all video controllers
    for (final controller in controllers.values) {
      controller.dispose();
    }

    // Dispose text controllers
    fromDestincationController.dispose();
    toDestincationController.dispose();
    weightController.dispose();
    fromDestincationFocus.dispose();
    toDestincationFocus.dispose();
    weightFocus.dispose();

    super.onClose();
  }

  Future<void> fetchTutorials() async {
    try {
      isLoading(true);
      errorMessage('');
      final fetchedTutorials = await apiService.fetchTutorials();
      tutorials.assignAll(fetchedTutorials.data);

      // Pre-cache thumbnail images
      for (final tutorial in tutorials) {
        if (tutorial.thumbnailUrl.isNotEmpty) {
          precacheImage(NetworkImage(tutorial.thumbnailUrl), Get.context!);
        }
      }
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void playVideo(int index, String videoUrl) {
    // If a different video is clicked, pause the current one
    if (currentlyPlayingIndex.value != null &&
        currentlyPlayingIndex.value != index) {
      controllers[currentlyPlayingIndex.value!]?.pause();
    }

    // Set the new playing index
    currentlyPlayingIndex(index);

    // Initialize controller if it doesn't exist
    if (!controllers.containsKey(index)) {
      final videoId = YoutubePlayer.convertUrlToId(videoUrl);
      if (videoId != null) {
        final newController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
            enableCaption: true,
          ),
        );

        // Add the new controller to the map
        controllers[index] = newController;

        // Force UI update when controller is ready
        newController.addListener(() {
          if (newController.value.isReady) {
            update();
          }
        });
      }
    } else {
      // If controller exists, play the video
      controllers[index]!.play();
    }

    // Force UI update
    update();
  }

  void toggleVideoPlayback(int index) {
    if (currentlyPlayingIndex.value == index && controllers[index] != null) {
      if (controllers[index]!.value.isPlaying) {
        controllers[index]!.pause();
      } else {
        controllers[index]!.play();
      }
      update();
    }
  }
}
