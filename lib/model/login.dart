import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';

@JsonSerializable()
class Login {
  @JsonKey(name: "_id")
  String? id;
  String? token;

  Login({
    this.id,
    this.token,
  });

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
