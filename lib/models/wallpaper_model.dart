import 'package:equatable/equatable.dart';
import 'package:slash/models/thumbs_model.dart';

class WallpaperModel extends Equatable {
  final String id;
  final String url;
  final String shortUrl;
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

  WallpaperModel({
    required this.id,
    required this.url,
    required this.shortUrl,
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
  });

  factory WallpaperModel.fromJson(Map<String, dynamic> json) => WallpaperModel(
        id: json["id"],
        url: json["url"],
        shortUrl: json["short_url"],
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
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "short_url": shortUrl,
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
      };

  @override
  List<Object?> get props => [id];
}
