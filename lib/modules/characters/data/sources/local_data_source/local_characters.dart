import 'package:second_task/modules/characters/data/models/m_character.dart';

abstract class LocalCharacters {
  Future<void> delete();

  MCharacter? get();

  Future<MCharacter> set(MCharacter user);
}
