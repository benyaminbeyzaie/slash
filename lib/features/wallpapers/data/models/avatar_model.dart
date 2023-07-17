class AvatarModel {
  final String the200Px;
  final String the128Px;
  final String the32Px;
  final String the20Px;

  AvatarModel({
    required this.the200Px,
    required this.the128Px,
    required this.the32Px,
    required this.the20Px,
  });

  factory AvatarModel.fromJson(Map<String, dynamic> json) => AvatarModel(
        the200Px: json["200px"],
        the128Px: json["128px"],
        the32Px: json["32px"],
        the20Px: json["20px"],
      );

  Map<String, dynamic> toJson() => {
        "200px": the200Px,
        "128px": the128Px,
        "32px": the32Px,
        "20px": the20Px,
      };
}
