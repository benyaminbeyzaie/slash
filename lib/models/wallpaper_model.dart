import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:slash/models/thumbs_model.dart';

part 'wallpaper_model.g.dart';

@HiveType(typeId: 0)
class WallpaperModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String url;
  @HiveField(2)
  final String shortUrl;
  @HiveField(3)
  final int views;
  @HiveField(4)
  final int favorites;
  @HiveField(5)
  final String source;
  @HiveField(6)
  final String purity;
  @HiveField(7)
  final String category;
  @HiveField(8)
  final int dimensionX;
  @HiveField(9)
  final int dimensionY;
  @HiveField(10)
  @HiveField(11)
  final String resolution;
  @HiveField(12)
  final String ratio;
  @HiveField(13)
  final int fileSize;
  @HiveField(14)
  final String fileType;
  @HiveField(15)
  final DateTime createdAt;
  @HiveField(16)
  final List<String> colors;
  @HiveField(17)
  final String path;
  @HiveField(18)
  final ThumbsModel thumbs;

  const WallpaperModel({
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
