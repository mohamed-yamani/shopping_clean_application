// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'convert_token_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConvertTokenTableAdapter extends TypeAdapter<ConvertTokenTable> {
  @override
  final int typeId = 1;

  @override
  ConvertTokenTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConvertTokenTable(
      accessToken: fields[0] as String?,
      expiresIn: fields[1] as int?,
      tokenType: fields[2] as String?,
      scope: fields[3] as String?,
      refreshToken: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ConvertTokenTable obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.expiresIn)
      ..writeByte(2)
      ..write(obj.tokenType)
      ..writeByte(3)
      ..write(obj.scope)
      ..writeByte(4)
      ..write(obj.refreshToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConvertTokenTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
