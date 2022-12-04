// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      fullName: json['fullName'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'image': instance.image,
      'phone': instance.phone,
      'address': instance.address,
    };
