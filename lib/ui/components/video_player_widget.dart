import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool isInitialized = false;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      _controller = VideoPlayerController.network(widget.videoUrl)
        ..initialize().then((_) {
          if (mounted) {
            setState(() {
              isInitialized = true;
            });
            _controller.play();
            _enterFullScreen();
          }
        }).catchError((error) {
          debugPrint("Error initializing video player: $error");
        });
    } catch (e) {
      debugPrint("Error setting up video player: $e");
    }
  }

  void _enterFullScreen() {
    setState(() {
      isFullScreen = true;
    });
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  void _exitFullScreen() {
    if (!mounted) return;
    setState(() {
      isFullScreen = false;
    });
    if (mounted) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
  }

  @override
  void dispose() {
    Future.delayed(Duration.zero, () {
      if (mounted) {
        _exitFullScreen();
      }
    });
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isInitialized
          ? GestureDetector(
              onTap: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Stack(
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                  if (!isFullScreen)
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: IconButton(
                        icon: const Icon(Icons.fullscreen, color: Colors.white),
                        onPressed: _enterFullScreen,
                      ),
                    ),
                  if (isFullScreen)
                    Positioned(
                      top: 20,
                      left: 20,
                      child: IconButton(
                        icon: const Icon(Icons.fullscreen_exit,
                            color: Colors.white),
                        onPressed: _exitFullScreen,
                      ),
                    ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
