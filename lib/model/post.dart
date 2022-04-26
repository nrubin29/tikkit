import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

DateTime fromMillisecondsSinceEpochUtc(num millisecondsSinceEpoch) =>
    DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch.toInt(),
        isUtc: true);

@JsonSerializable()
class ListPostsResponse {
  final ListPostsData data;

  const ListPostsResponse(this.data);

  factory ListPostsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPostsResponseFromJson(json);
}

@JsonSerializable()
class ListPostsData {
  final List<ListPostsDataChild> children;

  const ListPostsData(this.children);

  factory ListPostsData.fromJson(Map<String, dynamic> json) =>
      _$ListPostsDataFromJson(json);
}

@JsonSerializable()
class ListPostsDataChild {
  @JsonKey(name: 'data')
  final Post post;

  const ListPostsDataChild(this.post);

  factory ListPostsDataChild.fromJson(Map<String, dynamic> json) =>
      _$ListPostsDataChildFromJson(json);
}

@JsonSerializable()
class Post {
  final String subreddit;
  final String title;
  final int score;
  final Preview? preview;
  final String author;

  @JsonKey(name: 'num_comments')
  final int numComments;
  final String permalink;
  final String url;

  @JsonKey(name: 'created_utc', fromJson: fromMillisecondsSinceEpochUtc)
  final DateTime created;

  const Post(this.subreddit, this.title, this.score, this.preview,
      this.author, this.numComments, this.permalink, this.url, this.created);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

@JsonSerializable()
class Preview {
  final List<Image> images;

  const Preview(this.images);

  factory Preview.fromJson(Map<String, dynamic> json) =>
      _$PreviewFromJson(json);
}

@JsonSerializable()
class Image {
  final ImageSource source;
  final List<ImageSource> resolutions;

  const Image(this.source, this.resolutions);

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@JsonSerializable()
class ImageSource {
  final String url;

  const ImageSource(this.url);

  factory ImageSource.fromJson(Map<String, dynamic> json) =>
      _$ImageSourceFromJson(json);
}
