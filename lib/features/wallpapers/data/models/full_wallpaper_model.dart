import 'tag_model.dart';
import 'thumbs_model.dart';
import 'uploader_model.dart';
import 'package:equatable/equatable.dart';

class FullWallpaperModel extends Equatable {
  final String id;
  final String url;
  final String shortUrl;
  final UploaderModel uploader;
  final int views;
  final int favorites;
  final String source;
  final String purity;
  final String category;
  final int dimensionX;
  final int dimensionY;
  final String resolution;
  final String ratio;
  final int fileSize;
  final String fileType;
  final DateTime createdAt;
  final List<String> colors;
  final String path;
  final ThumbsModel thumbs;
  final List<TagModel> tags;

  const FullWallpaperModel({
    required this.id,
    required this.url,
    required this.shortUrl,
    required this.uploader,
    required this.views,
    required this.favorites,
    required this.source,
    required this.purity,
    required this.category,
    required this.dimensionX,
    required this.dimensionY,
    required this.resolution,
    required this.ratio,
    required this.fileSize,
    required this.fileType,
    required this.createdAt,
    required this.colors,
    required this.path,
    required this.thumbs,
    required this.tags,
  });

  factory FullWallpaperModel.fromJson(Map<String, dynamic> json) =>
      FullWallpaperModel(
        id: json["id"],
        url: json["url"],
        shortUrl: json["short_url"],
        uploader: UploaderModel.fromJson(json["uploader"]),
        views: json["views"],
        favorites: json["favorites"],
        source: json["source"],
        purity: json["purity"],
        category: json["category"],
        dimensionX: json["dimension_x"],
        dimensionY: json["dimension_y"],
        resolution: json["resolution"],
        ratio: json["ratio"],
        fileSize: json["file_size"],
        fileType: json["file_type"],
        createdAt: DateTime.parse(json["created_at"]),
        colors: List<String>.from(json["colors"].map((x) => x)),
        path: json["path"],
        thumbs: ThumbsModel.fromJson(json["thumbs"]),
        tags:
            List<TagModel>.from(json["tags"].map((x) => TagModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "short_url": shortUrl,
        "uploader": uploader.toJson(),
        "views": views,
        "favorites": favorites,
        "source": source,
        "purity": purity,
        "category": category,
        "dimension_x": dimensionX,
        "dimension_y": dimensionY,
        "resolution": resolution,
        "ratio": ratio,
        "file_size": fileSize,
        "file_type": fileType,
        "created_at": createdAt.toIso8601String(),
        "colors": List<String>.from(colors.map((x) => x)),
        "path": path,
        "thumbs": thumbs.toJson(),
        "tags": List<Map<String, dynamic>>.from(tags.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [id];
}
