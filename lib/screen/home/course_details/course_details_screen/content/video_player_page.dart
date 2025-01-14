import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xirfadkaab/widgets/custom_app_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatelessWidget {
  //todo videoUrl dynamic
  final String? videoUrl;
  const VideoPlayerPage({super.key, this.videoUrl});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController? controller;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: CustomAppBar(appBarName: 'video_player'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: YoutubePlayer(
          controller: controller ??
              YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(
                    videoUrl ?? "https://youtu.be/3l6Q4QL-j4Q")!,
                flags: const YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              ),
          liveUIColor: Colors.amber,
        ),
      ),
    );
  }
}
