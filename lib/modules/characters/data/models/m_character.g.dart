// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_character.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MCharacterAdapter extends TypeAdapter<MCharacter> {
  @override
  final int typeId = 1;

  @override
  MCharacter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MCharacter(
      id: fields[0] as String?,
      name: fields[1] as String?,
      alternateNames: (fields[2] as List?)?.cast<String>(),
      species: fields[3] as String?,
      gender: fields[4] as String?,
      house: fields[5] as String?,
      dateOfBirth: fields[6] as String?,
      yearOfBirth: fields[7] as String?,
      wizard: fields[8] as bool?,
      ancestry: fields[9] as String?,
      eyeColour: fields[10] as String?,
      hairColour: fields[11] as String?,
      wand: fields[12] as MWand?,
      patronus: fields[13] as String?,
      hogwartsStudent: fields[14] as bool?,
      hogwartsStaff: fields[15] as bool?,
      actor: fields[16] as String?,
      alternateActors: (fields[17] as List?)?.cast<String>(),
      alive: fields[18] as bool?,
      image: fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MCharacter obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.alternateNames)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.house)
      ..writeByte(6)
      ..write(obj.dateOfBirth)
      ..writeByte(7)
      ..write(obj.yearOfBirth)
      ..writeByte(8)
      ..write(obj.wizard)
      ..writeByte(9)
      ..write(obj.ancestry)
      ..writeByte(10)
      ..write(obj.eyeColour)
      ..writeByte(11)
      ..write(obj.hairColour)
      ..writeByte(12)
      ..write(obj.wand)
      ..writeByte(13)
      ..write(obj.patronus)
      ..writeByte(14)
      ..write(obj.hogwartsStudent)
      ..writeByte(15)
      ..write(obj.hogwartsStaff)
      ..writeByte(16)
      ..write(obj.actor)
      ..writeByte(17)
      ..write(obj.alternateActors)
      ..writeByte(18)
      ..write(obj.alive)
      ..writeByte(19)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MCharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MWandAdapter extends TypeAdapter<MWand> {
  @override
  final int typeId = 2;

  @override
  MWand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MWand(
      wood: fields[0] as String?,
      core: fields[1] as String?,
      length: fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, MWand obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.wood)
      ..writeByte(1)
      ..write(obj.core)
      ..writeByte(2)
      ..write(obj.length);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MWandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
