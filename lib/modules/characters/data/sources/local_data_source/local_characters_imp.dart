import 'package:second_task/modules/characters/data/models/m_character.dart';
import 'package:second_task/modules/characters/data/sources/local_data_source/box_characters.dart';
import 'package:second_task/modules/characters/data/sources/local_data_source/local_characters.dart';

class LocalCharactersImp implements LocalCharacters {
  final BoxCharacters boxUser;

  LocalCharactersImp({
    required this.boxUser,
  });

  @override
  Future<void> delete() async {
    await boxUser.box.delete(0);
  }

  @override
  MCharacter? get() => boxUser.box.get(0);

  @override
  Future<MCharacter> set(MCharacter user) async {
    await boxUser.box.put(0, user);
    return user;
  }
}