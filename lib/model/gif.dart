import 'package:json_annotation/json_annotation.dart';

part 'gif.g.dart';

@JsonSerializable()
class GifResponse {
  @JsonKey(name: 'gfyItem')
  final Gif gif;

  const GifResponse(this.gif);

  factory GifResponse.fromJson(Map<String, dynamic> json) =>
      _$GifResponseFromJson(json);
}

@JsonSerializable()
class Gif {
  @JsonKey(name: 'content_urls')
  final GifUrls urls;

  const Gif(this.urls);

  factory Gif.fromJson(Map<String, dynamic> json) => _$GifFromJson(json);
}

@JsonSerializable()
class GifUrls {
  final GifUrl mp4;

  const GifUrls(this.mp4);

  factory GifUrls.fromJson(Map<String, dynamic> json) =>
      _$GifUrlsFromJson(json);
}

@JsonSerializable()
class GifUrl {
  final String url;

  const GifUrl(this.url);

  factory GifUrl.fromJson(Map<String, dynamic> json) => _$GifUrlFromJson(json);
}
