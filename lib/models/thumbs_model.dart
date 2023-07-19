class ThumbsModel {
  final String large;
  final String original;
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
