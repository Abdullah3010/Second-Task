import 'package:second_task/modules/characters/data/models/m_character.dart';

abstract class LocalCharacters {
  Future<void> clear();

  List<MCharacter>? getAll();

  Future<void> setAll(List<MCharacter> characters);
}
