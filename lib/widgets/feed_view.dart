import 'package:flutter/material.dart';
import 'package:tikkit/model/post.dart';
import 'package:tikkit/service/reddit.dart';
import 'package:tikkit/widgets/post_view.dart';

class FeedView extends StatefulWidget {
  const FeedView();

  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  List<Post>? _posts;
  final _controller = PageController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onPageChange);
    _fetchData();
  }

  Future<void> _fetchData() async {
    final posts =
        await Reddit.getPosts(subreddit: 'gifs', sortMethod: SortMethod.hot);

    setState(() {
      _posts = posts;
    });
  }

  void _onPageChange() {
    if (_controller.page! % 1 == 0) {
      print(_controller.page);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _posts == null
            ? const Center(child: CircularProgressIndicator())
            : PageView.builder(
                controller: _controller,
                scrollDirection: Axis.vertical,
                itemCount: _posts!.length,
                itemBuilder: (context, index) => PostView(_posts![index]),
              ),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
