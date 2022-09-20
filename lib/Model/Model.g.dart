// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MembersAdapter extends TypeAdapter<Members> {
  @override
  final int typeId = 0;

  @override
  Members read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Members()
      ..name = fields[0] as String
      ..department = fields[1] as String
      ..age = fields[2] as int;
  }

  @override
  void write(BinaryWriter writer, Members obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.department)
      ..writeByte(2)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MembersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
