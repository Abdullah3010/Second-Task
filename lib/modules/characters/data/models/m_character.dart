import 'package:hive/hive.dart';

part 'm_character.g.dart';

@HiveType(typeId: 1)
class MCharacter {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  List<String>? alternateNames;
  @HiveField(3)
  String? species;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  String? house;
  @HiveField(6)
  String? dateOfBirth;
  @HiveField(7)
  String? yearOfBirth;
  @HiveField(8)
  bool? wizard;
  @HiveField(9)
  String? ancestry;
  @HiveField(10)
  String? eyeColour;
  @HiveField(11)
  String? hairColour;
  @HiveField(12)
  MWand? wand;
  @HiveField(13)
  String? patronus;
  @HiveField(14)
  bool? hogwartsStudent;
  @HiveField(15)
  bool? hogwartsStaff;
  @HiveField(16)
  String? actor;
  @HiveField(17)
  List<String>? alternateActors;
  @HiveField(18)
  bool? alive;
  @HiveField(19)
  String? image;

  MCharacter({
    this.id,
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    this.wizard,
    this.ancestry,
    this.eyeColour,
    this.hairColour,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alternateActors,
    this.alive,
    this.image,
  });

  factory MCharacter.fromJson(Map<String, dynamic>? json) {
    return MCharacter(
      id: json?['id'] ?? '',
      name: json?['name'] ?? '',
      alternateNames: List<String>.from(json?['alternate_names'] ?? []),
      species: json?['species'] ?? '',
      gender: json?['gender'] ?? '',
      house: json?['house'] ?? '',
      dateOfBirth: json?['dateOfBirth']?.toString() ?? '',
      yearOfBirth: json?['yearOfBirth']?.toString() ?? '',
      wizard: json?['wizard'] ?? false,
      ancestry: json?['ancestry'] ?? '',
      eyeColour: json?['eyeColour'] ?? '',
      hairColour: json?['hairColour'] ?? '',
      wand: MWand.fromJson(json?['wand']),
      patronus: json?['patronus'] ?? '',
      hogwartsStudent: json?['hogwartsStudent'] ?? false,
      hogwartsStaff: json?['hogwartsStaff'] ?? false,
      actor: json?['actor'] ?? '',
      alternateActors: List<String>.from(json?['alternate_actors'] ?? []),
      alive: json?['alive'] ?? false,
      image: json?['image'] ?? '',
    );
  }
}

@HiveType(typeId: 2)
class MWand {
  @HiveField(0)
  String? wood;
  @HiveField(1)
  String? core;
  @HiveField(2)
  double? length;

  MWand({
    this.wood,
    this.core,
    this.length,
  });

  factory MWand.fromJson(Map<String, dynamic>? json) {
    return MWand(
      wood: json?['wood'] ?? '',
      core: json?['core'] ?? '',
      length: double.tryParse(json?['length']?.toString() ?? '') ?? 0.0,
    );
  }
}
