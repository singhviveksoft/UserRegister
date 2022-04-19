import 'dart:core';

import 'package:hive/hive.dart';

part 'user_registeration_model.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String? img;

  @HiveField(1)
  String? fName;

  @HiveField(2)
  String? lName;

  @HiveField(3)
  int? phoneNumber;

  @HiveField(4)
  String? email;

  @HiveField(5)
  String? gender;

  @HiveField(6)
  String? pwd;

  @HiveField(7)
  String? edu;

  @HiveField(9)
  String? yop;

  @HiveField(10)
  String? grade;

  @HiveField(11)
  String? exp;

  @HiveField(12)
  String? designation;

  @HiveField(13)
  String? domain;

  @HiveField(14)
  String? address;

  @HiveField(15)
  String? landmark;

  @HiveField(16)
  String? city;

  @HiveField(17)
  String? state;

  @HiveField(18)
  String? pinCode;

  User(
      [this.img,
      this.fName,
      this.lName,
      this.phoneNumber,
      this.email,
      this.gender,
      this.pwd,
      this.edu,
      this.yop,
      this.grade,
      this.exp,
      this.designation,
      this.domain,
      this.address,
      this.landmark,
      this.city,
      this.state,
      this.pinCode]);
}
