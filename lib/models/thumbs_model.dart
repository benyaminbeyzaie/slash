import 'package:hive_flutter/hive_flutter.dart';

part 'thumbs_model.g.dart';

@HiveType(typeId: 1)
class ThumbsModel {
  @HiveField(0)
  final String large;
  @HiveField(1)
  final String original;
  @HiveField(2)
  final String small;

  ThumbsModel({
    required this.large,
    required this.original,
    required this.small,
  });

  factory ThumbsModel.fromJson(Map<String, dynamic> json) => ThumbsModel(
        large: json["large"],
        original: json["original"],
        small: json["small"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "original": original,
        "small": small,
      };
}
