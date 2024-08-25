// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokenote.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokeNoteAdapter extends TypeAdapter<PokeNote> {
  @override
  final int typeId = 0;

  @override
  PokeNote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokeNote(
      note: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PokeNote obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.note);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokeNoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
