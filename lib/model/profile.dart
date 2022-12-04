import 'package:json_annotation/json_annotation.dart';
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  String? fullName;
  String? image;
  String? phone;
  String? address;

  Profile({this.fullName, this.image, this.phone, this.address});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
