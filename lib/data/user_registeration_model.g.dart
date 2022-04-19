// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_registeration_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      img: fields[0] as String?,
      fName: fields[1] as String?,
      lName: fields[2] as String?,
      phoneNumber: fields[3] as String?,
      email: fields[4] as String?,
      gender: fields[5] as String?,
      pwd: fields[6] as String?,
      edu: fields[7] as String?,
      yop: fields[9] as String?,
      grade: fields[10] as String?,
      exp: fields[11] as String?,
      designation: fields[12] as String?,
      domain: fields[13] as String?,
      address: fields[14] as String?,
      landmark: fields[15] as String?,
      city: fields[16] as String?,
      state: fields[17] as String?,
      pinCode: fields[18] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.img)
      ..writeByte(1)
      ..write(obj.fName)
      ..writeByte(2)
      ..write(obj.lName)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.pwd)
      ..writeByte(7)
      ..write(obj.edu)
      ..writeByte(9)
      ..write(obj.yop)
      ..writeByte(10)
      ..write(obj.grade)
      ..writeByte(11)
      ..write(obj.exp)
      ..writeByte(12)
      ..write(obj.designation)
      ..writeByte(13)
      ..write(obj.domain)
      ..writeByte(14)
      ..write(obj.address)
      ..writeByte(15)
      ..write(obj.landmark)
      ..writeByte(16)
      ..write(obj.city)
      ..writeByte(17)
      ..write(obj.state)
      ..writeByte(18)
      ..write(obj.pinCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
