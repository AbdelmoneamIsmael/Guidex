// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      message: fields[0] as String?,
      isAuthenticated: fields[1] as bool?,
      id: fields[2] as int?,
      email: fields[3] as String?,
      deviceToken: fields[4] as String?,
      imageUrl: fields[5] as String?,
      roles: (fields[6] as List).cast<String>(),
      token: fields[7] as String?,
      expiresOn: fields[8] as DateTime?,
      refreshToken: fields[9] as String?,
      refreshTokenExpiration: fields[10] as DateTime?,
      statusCode: fields[11] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.isAuthenticated)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.deviceToken)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.roles)
      ..writeByte(7)
      ..write(obj.token)
      ..writeByte(8)
      ..write(obj.expiresOn)
      ..writeByte(9)
      ..write(obj.refreshToken)
      ..writeByte(10)
      ..write(obj.refreshTokenExpiration)
      ..writeByte(11)
      ..write(obj.statusCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
