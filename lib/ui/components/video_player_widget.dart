import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final VoidCallback? onVideoEnd;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
    this.onVideoEnd,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool isInitialized = false;
  bool showControls = true;
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
            _hideControlsAfterDelay();
          }
        }).catchError((error) {
          debugPrint("Error initializing video player: $error");
        });

      _controller.addListener(() {
        if (_controller.value.isInitialized &&
            !_controller.value.isPlaying &&
            _controller.value.position >= _controller.value.duration) {
          widget.onVideoEnd?.call();
        }
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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  void _hideControlsAfterDelay() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && _controller.value.isPlaying) {
        setState(() {
          showControls = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _formatDuration(Duration duration) {
      final minutes =
          duration.inMinutes.remainder(60).toString().padLeft(2, '0');
      final seconds =
          duration.inSeconds.remainder(60).toString().padLeft(2, '0');
      return "$minutes:$seconds";
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          setState(() {
            showControls = !showControls;
          });
          if (_controller.value.isPlaying) {
            _hideControlsAfterDelay();
          }
        },
        child: Stack(
          children: [
            Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
            if (showControls) ...[
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 64,
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                            _hideControlsAfterDelay();
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 10, // Kalınlık için yükseklik ayarı
                        child: VideoProgressIndicator(
                          _controller,
                          allowScrubbing: true,
                          colors: const VideoProgressColors(
                            playedColor: Colors.red,
                            bufferedColor: Colors.grey,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "${_formatDuration(_controller.value.position)} / ${_formatDuration(
                          _controller.value.duration -
                              _controller.value.position,
                        )}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
