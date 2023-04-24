// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrinkModelAdapter extends TypeAdapter<DrinkModel> {
  @override
  final int typeId = 0;

  @override
  DrinkModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DrinkModel(
      name: fields[0] as String,
      isFavourite: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DrinkModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.isFavourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrinkModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
