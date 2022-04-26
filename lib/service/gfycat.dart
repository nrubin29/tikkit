import 'dart:convert';

import 'package:http/http.dart';
import 'package:tikkit/model/gif.dart';

class Gfycat {
  static final _client = Client();

  static Future<Gif> getGif(String id) async {
    final response = await _client.get(Uri(
      scheme: 'https',
      host: 'api.gfycat.com',
      pathSegments: ['v1', 'gfycats', id],
    ));

    return GifResponse.fromJson(json.decode(utf8.decode(response.bodyBytes)))
        .gif;
  }
}
