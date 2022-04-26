import 'package:flutter/material.dart';
import 'package:tikkit/model/post.dart' hide Image;
import 'package:tikkit/service/gfycat.dart';
import 'package:video_player/video_player.dart';

class PostView extends StatefulWidget {
  final Post post;

  const PostView(this.post);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  var _fit = BoxFit.cover;
  String? _gifUrl;
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _setup();
  }

  Future<void> _setup() async {
    final uri = Uri.parse(widget.post.url);
    print(uri);
    if (uri.pathSegments.last.endsWith('.gif')) {
      setState(() {
        _gifUrl = widget.post.url;
      });
    } else if (uri.host == 'gfycat.com') {
      final gif = await Gfycat.getGif(uri.pathSegments.last);
      final videoPlayerController =
          VideoPlayerController.network(gif.urls.mp4.url);
      await videoPlayerController.initialize();
      await videoPlayerController.setVolume(0);
      await videoPlayerController.setLooping(true);

      setState(() {
        _videoPlayerController = videoPlayerController;
      });

      videoPlayerController.play();
    }
  }

  void _onDoubleTap() {
    setState(() {
      _fit = _fit == BoxFit.cover ? BoxFit.contain : BoxFit.cover;
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onDoubleTap: _onDoubleTap,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (_videoPlayerController != null)
              Center(
                child: AspectRatio(
                  aspectRatio: _videoPlayerController!.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController!),
                ),
              )
            else if (widget.post.preview != null)
              Image.network(
                _gifUrl ??
                    widget.post.preview!.images.first.resolutions.last.url,
                fit: _fit,
              ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.center,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.grey.withOpacity(0),
                    Colors.black.withOpacity(0.75),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: SafeArea(
                minimum: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'u/${widget.post.author}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'r/${widget.post.subreddit}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.post.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: SafeArea(
                minimum: const EdgeInsets.all(16),
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 16,
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: 32,
                    ),
                    Text(
                      '${widget.post.score}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                      size: 32,
                    ),
                    const Icon(
                      Icons.comment,
                      color: Colors.white,
                      size: 32,
                    ),
                    Text(
                      '${widget.post.numComments}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.adaptive.share,
                      color: Colors.white,
                      size: 32,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
