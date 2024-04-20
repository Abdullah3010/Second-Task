import 'package:second_task/modules/characters/data/models/m_character.dart';

abstract class RepoCharacters {
  Future<List<MCharacter>?> getAllCharacters();
  Future<MCharacter?> getCharacterDetails(String id);
}
