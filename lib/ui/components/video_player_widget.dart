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
                      child: Stack(
                        children: [
                          SliderTheme(
                            data: SliderThemeData(
                              trackHeight: 4,
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 8,
                              ),
                              thumbColor: Colors.red,
                              activeTrackColor: Colors.red,
                              inactiveTrackColor: Colors.grey,
                              overlayColor: Colors.red.withOpacity(0.2),
                            ),
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                double dragValue = _controller
                                    .value.position.inMilliseconds
                                    .toDouble();
                                return Slider(
                                  min: 0,
                                  max: _controller
                                      .value.duration.inMilliseconds
                                      .toDouble(),
                                  value: dragValue,
                                  onChanged: (value) {
                                    setState(() {
                                      dragValue = value;
                                    });
                                    _controller.seekTo(Duration(
                                        milliseconds: value.toInt()));
                                  },
                                  onChangeStart: (value) {
                                    _controller.pause();
                                  },
                                  onChangeEnd: (value) {
                                    _controller.seekTo(Duration(
                                        milliseconds: value.toInt()));
                                    _controller.play();
                                  },
                                );
                              },
                            ),
                          ),
                          StatefulBuilder(
                            builder: (context, setState) {
                              double dragValue = _controller
                                  .value.position.inMilliseconds
                                  .toDouble();
                              final positionFraction = _controller
                                          .value.duration.inMilliseconds >
                                      0
                                  ? dragValue /
                                      _controller
                                          .value.duration.inMilliseconds
                                  : 0.0;

                              return Positioned(
                                left: positionFraction *
                                    (MediaQuery.of(context).size.width - 40),
                                child: Visibility(
                                  visible: true,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      _formatDuration(Duration(
                                          milliseconds: dragValue.toInt())),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "${_formatDuration(_controller.value.position)} / ${_formatDuration(_controller.value.duration)}",
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
