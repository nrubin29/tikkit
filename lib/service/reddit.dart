import 'dart:convert';

import 'package:http/http.dart';
import 'package:tikkit/model/post.dart';

enum SortMethod { hot, recent, random, rising, top, controversial }

extension on SortMethod {
  String get apiValue {
    switch (this) {
      case SortMethod.recent:
        return "new";
      default:
        return name;
    }
  }
}

class Reddit {
  static final _client = Client();

  static Future<List<Post>> getPosts(
      {required String subreddit, required SortMethod sortMethod}) async {
    final response = await _client.get(Uri(
      scheme: 'https',
      host: 'api.reddit.com',
      pathSegments: ['r', subreddit, sortMethod.apiValue],
      queryParameters: {'raw_json': '1'},
    ));

    return ListPostsResponse.fromJson(
            json.decode(utf8.decode(response.bodyBytes)))
        .data
        .children
        .map((e) => e.post)
        .toList(growable: false);
  }
}
