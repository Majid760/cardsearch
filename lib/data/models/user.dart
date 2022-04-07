import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String? name;
  String? country;
  String? city;
  String? cnic;
  String? address;
  String? age;
  int? updatedDate;
  int? createdDate;

  User({name, country, city, cnic, address, age, updatedDate, createdDate});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
