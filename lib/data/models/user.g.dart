// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'],
      country: json['country'],
      city: json['city'],
      cnic: json['cnic'],
      address: json['address'],
      age: json['age'],
      updatedDate: json['updatedDate'],
      createdDate: json['createdDate'],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'city': instance.city,
      'cnic': instance.cnic,
      'address': instance.address,
      'age': instance.age,
      'updatedDate': instance.updatedDate,
      'createdDate': instance.createdDate,
    };
