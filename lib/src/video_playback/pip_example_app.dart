import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_handbook/src/video_playback/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class PIPExampleApp extends StatefulWidget {
  const PIPExampleApp({super.key});

  @override
  State<PIPExampleApp> createState() => _PIPExampleAppState();
}

class _PIPExampleAppState extends State<PIPExampleApp>
    with WidgetsBindingObserver {
  final String videoUrl =
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4';

  late Floating pip; // Initializing a variable to handle PiP functionalities
  bool isPipAvailable = false; // Variable to track PiP availability status
  late VideoPlayerController _videoController;

  @override
  void initState() {
    pip =
        Floating(); // Instantiating the "Floating" instance to manage PiP functionality
    super.initState();
    _checkPiPAvailability(); // Checking the availability of PiP upon initializing the widget
    // Initialize video player controller with the provided video URL
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
    )..initialize().then((_) {
        // Set the video to loop and start playing once initialized
        _videoController.setLooping(true);
        _videoController.play();
        setState(() {});
      });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Listening to app lifecycle changes to detect when the app enters the hidden state (minimized)
    if (state == AppLifecycleState.paused && isPipAvailable) {
      // Triggering PiP mode with a landscape aspect ratio when the app is minimized
      pip.enable(aspectRatio: const Rational.landscape());
    }
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose of the video controller when the widget is disposed
    _videoController.dispose();
  }

  // Method to verify the availability of PiP feature asynchronously
  _checkPiPAvailability() async {
    isPipAvailable = await pip
        .isPipAvailable; // Checking if PiP mode is available on the device
    setState(
        () {}); // Triggering a UI update based on the PiP availability status
  }

  @override
  Widget build(BuildContext context) {
    return PiPSwitcher(
      // Widget displayed when PiP is disabled or app is in foreground state
      childWhenDisabled: Scaffold(
        body: Column(
          children: [
            VideoPlayerWidget(videoUrl: videoUrl, controller: _videoController),
            ElevatedButton(
              onPressed: () {
                _videoController.play();
              },
              child: Text('Play'),
            ),
            ElevatedButton(
              onPressed: () {
                _videoController.pause();
              },
              child: Text('Pause'),
            ),
            Expanded(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Enabling PiP mode if available and configuring the aspect ratio for landscape orientation.
                    if (isPipAvailable) {
                      pip.enable(
                          aspectRatio: const Rational
                              .landscape()); // Enabling PiP with a landscape aspect ratio
                    }
                  },
                  child:
                      Text(isPipAvailable ? 'Enable PIP' : 'PIP not available'),
                ),
              ),
            ),
          ],
        ),
      ),
      // Widget displayed when PiP window is enabled or app is in background state
      childWhenEnabled: VideoPlayerWidget(
        videoUrl: videoUrl,
        controller: _videoController,
      ),
    );
  }
}
