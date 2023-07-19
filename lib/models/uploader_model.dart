import 'avatar_model.dart';

class UploaderModel {
  final String username;
  final String group;
  final AvatarModel avatar;

  UploaderModel({
    required this.username,
    required this.group,
    required this.avatar,
  });

  factory UploaderModel.fromJson(Map<String, dynamic> json) => UploaderModel(
        username: json["username"],
        group: json["group"],
        avatar: AvatarModel.fromJson(json["avatar"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "group": group,
        "avatar": avatar.toJson(),
      };
}
