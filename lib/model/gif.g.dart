// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gif.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GifResponse _$GifResponseFromJson(Map<String, dynamic> json) => GifResponse(
      Gif.fromJson(json['gfyItem'] as Map<String, dynamic>),
    );

Gif _$GifFromJson(Map<String, dynamic> json) => Gif(
      GifUrls.fromJson(json['content_urls'] as Map<String, dynamic>),
    );

GifUrls _$GifUrlsFromJson(Map<String, dynamic> json) => GifUrls(
      GifUrl.fromJson(json['mp4'] as Map<String, dynamic>),
    );

GifUrl _$GifUrlFromJson(Map<String, dynamic> json) => GifUrl(
      json['url'] as String,
    );
