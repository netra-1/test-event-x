import 'package:flutter_initializartion/model/profile.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  Profile? profile;
  String? email;
  String? category;
  String? password;

  User({
    this.profile,
    this.email,
    this.category,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
