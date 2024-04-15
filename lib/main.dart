import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart' as Chewie;
import 'package:flutter_subtitle/flutter_subtitle.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_netflix_api_admin_web/src/presentation/common/widgets/netflix_video_player/custom_controls.dart';
import 'package:subtitle_wrapper_package/data/models/style/subtitle_style.dart';
//import 'package:subtitle_wrapper_package/subtitle_controller.dart';
//import 'package:subtitle_wrapper_package/subtitle_controller.dart';
//import 'package:subtitle_wrapper_package/subtitle_wrapper.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_subtitle/flutter_subtitle.dart' as FlutterSubTitle;

import 'src/presentation/common/widgets/flutter_hover_icon/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Video Player with Chewie',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: NetflixPlayerDemo(),
    );
  }
}

class NetflixPlayerDemo extends StatefulWidget {
  @override
  _NetflixPlayerDemoState createState() => _NetflixPlayerDemoState();
}

class _NetflixPlayerDemoState extends State<NetflixPlayerDemo> {
  bool _showControls = false;
  Timer? _timer;
  Chewie.ChewieController? _controller;
  SubtitleController? _subtitleController;

  Future<void> initVideoPlayer() async {
    final videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse('http://localhost:3000/series/test-stream'),
        formatHint: VideoFormat.dash);

    await videoPlayerController.initialize();

    _controller = Chewie.ChewieController(
        aspectRatio: videoPlayerController.value.aspectRatio,
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        looping: false,
        autoInitialize: false,
        customControls: const CustomVideoControls(),
        subtitleBuilder: (context, subtitle) {
          return IgnorePointer(
            child: SubtitleView(
              text: subtitle,
              subtitleStyle: FlutterSubTitle.SubtitleStyle(
                fontSize: _controller!.isFullScreen ? 20 : 16,
              ),
            ),
          );
        },
        fullScreenByDefault: false);

    _controller!.setSubtitle(_subtitleController!.subtitles
        .map(
          (e) => Chewie.Subtitle(
            index: e.number,
            start: Duration(milliseconds: e.start),
            end: Duration(milliseconds: e.end),
            text: e.text,
          ),
        )
        .toList());

    setState(() {});
  }

  /*void initSubtitles() {
    subtitleController = SubtitleController(
        subtitleUrl: "http://localhost:3000/series/test-subtitle",
        // subtitlesContent: 'assets/subtitles/vinland_saga_01.vtt',
        subtitleType: SubtitleType.webvtt,
        subtitleDecoder: SubtitleDecoder.utf8);
  }*/

  Future<void> initSubtitles() async {
    final body = utf8.decode((await http
            .get(Uri.parse('http://localhost:3000/series/test-subtitle')))
        .bodyBytes);

    _subtitleController =
        SubtitleController.string(body, format: SubtitleFormat.webvtt);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      initSubtitles();
      await initVideoPlayer();

      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller != null &&
              _controller!.videoPlayerController.value.isInitialized
          ? Stack(fit: StackFit.expand, children: [
              AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: Chewie.Chewie(
                  controller: _controller!,
                ),
              ),
              if (_showControls)
                SizedBox.expand(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: VideoBottomControls(controller: _controller!))),
              if (_showControls)
                const SizedBox.expand(
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: VideoTopControls())),
            ])
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class VideoBottomControls extends StatefulWidget {
  final Chewie.ChewieController controller;

  VideoBottomControls({required this.controller});

  @override
  VideoControlsState createState() => VideoControlsState();
}

class VideoControlsState extends State<VideoBottomControls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VideoProgressIndicator(widget.controller.videoPlayerController,
              allowScrubbing: true),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconHoverExpanded(
                      child: IconButton(
                        icon: SvgPicture.asset(
                            'assets/SVGs/video_player/play.svg',
                            colorFilter: const ColorFilter.mode(
                                Colors.white, BlendMode.srcIn)),
                        onPressed: () {
                          setState(() {
                            if (widget.controller.isPlaying) {
                              widget.controller.pause();
                            } else {
                              widget.controller.play();
                            }
                          });
                        },
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: SvgPicture.asset(
                          'assets/SVGs/video_player/back_10.svg',
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)),
                      onPressed: () {
                        widget.controller.seekTo(Duration.zero);
                      },
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: SvgPicture.asset(
                          'assets/SVGs/video_player/forward_10.svg',
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)),
                      onPressed: () {
                        widget.controller.seekTo(Duration.zero);
                      },
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                        'assets/SVGs/video_player/volume_high.svg',
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn)),
                    onPressed: () {
                      widget.controller.seekTo(Duration.zero);
                    },
                    color: Colors.white,
                  ),
                ],
              ),
              const Text('Vikingos E1: Ritos de iniciación'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: SvgPicture.asset(
                          'assets/SVGs/video_player/next_episode.svg',
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)),
                      onPressed: () {
                        widget.controller.seekTo(Duration.zero);
                      },
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: SvgPicture.asset(
                          'assets/SVGs/video_player/episodes.svg',
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)),
                      onPressed: () {
                        widget.controller.seekTo(Duration.zero);
                      },
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: SvgPicture.asset(
                          'assets/SVGs/video_player/subtitles.svg',
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)),
                      onPressed: () {
                        widget.controller.seekTo(Duration.zero);
                      },
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: SvgPicture.asset(
                          'assets/SVGs/video_player/internet_speed.svg',
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)),
                      onPressed: () {
                        widget.controller.seekTo(Duration.zero);
                      },
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                        'assets/SVGs/video_player/full_screen_enter.svg',
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn)),
                    onPressed: () {
                      widget.controller.enterFullScreen();
                    },
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class VideoTopControls extends StatelessWidget {
  const VideoTopControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset('assets/SVGs/video_player/arrow_left.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
              onPressed: () {},
              color: Colors.white,
            ),
          ],
        ));
  }
}
