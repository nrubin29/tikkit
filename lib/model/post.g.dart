// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListPostsResponse _$ListPostsResponseFromJson(Map<String, dynamic> json) =>
    ListPostsResponse(
      ListPostsData.fromJson(json['data'] as Map<String, dynamic>),
    );

ListPostsData _$ListPostsDataFromJson(Map<String, dynamic> json) =>
    ListPostsData(
      (json['children'] as List<dynamic>)
          .map((e) => ListPostsDataChild.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ListPostsDataChild _$ListPostsDataChildFromJson(Map<String, dynamic> json) =>
    ListPostsDataChild(
      Post.fromJson(json['data'] as Map<String, dynamic>),
    );

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['subreddit'] as String,
      json['title'] as String,
      json['score'] as int,
      json['preview'] == null
          ? null
          : Preview.fromJson(json['preview'] as Map<String, dynamic>),
      json['author'] as String,
      json['num_comments'] as int,
      json['permalink'] as String,
      json['url'] as String,
      fromMillisecondsSinceEpochUtc(json['created_utc'] as num),
    );

Preview _$PreviewFromJson(Map<String, dynamic> json) => Preview(
      (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      ImageSource.fromJson(json['source'] as Map<String, dynamic>),
      (json['resolutions'] as List<dynamic>)
          .map((e) => ImageSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ImageSource _$ImageSourceFromJson(Map<String, dynamic> json) => ImageSource(
      json['url'] as String,
    );
