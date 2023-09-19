// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..username = fields[0] as String
      ..id = fields[1] as int
      ..password = fields[2] as String
      ..nickname = fields[3] as String
      ..email = fields[4] as String
      ..phone = fields[5] as String
      ..address = fields[6] as String
      ..create_time = fields[7] as DateTime
      ..avatar_url = fields[8] as String
      ..role = fields[9] as String;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.nickname)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.create_time)
      ..writeByte(8)
      ..write(obj.avatar_url)
      ..writeByte(9)
      ..write(obj.role);
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
