import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  // Video URL
  final String videoUrl;
  final VideoPlayerController controller;

  const VideoPlayerWidget(
      {Key? key, required this.controller, required this.videoUrl})
      : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(
                  key: UniqueKey(),
                  // Ensures the VideoPlayer widget rebuilds when a new controller is set
                  _controller,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    padding: EdgeInsets.zero,
                  ),
                ),
              ],
            ),
          )
        // Display a circular progress indicator while the video loads
        : const Center(child: CircularProgressIndicator());
  }

}
