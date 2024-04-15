import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class NetflixPlayerDemo extends StatefulWidget {
  const NetflixPlayerDemo({super.key});

  @override
  NetflixPlayerDemoState createState() => NetflixPlayerDemoState();
}

class NetflixPlayerDemoState extends State<NetflixPlayerDemo> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Netflix Video Player'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
              _isPlaying = false;
            } else {
              _controller.play();
              _isPlaying = true;
            }
          });
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
            _controller.value.isInitialized
                ? Container()
                : const CircularProgressIndicator(),
            _isPlaying
                ? Container()
                : const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 64.0,
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
