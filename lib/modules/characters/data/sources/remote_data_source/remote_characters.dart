import 'package:second_task/modules/characters/data/models/m_character.dart';

abstract class RemoteCharacters {
  Future<List<MCharacter>?> getAllCharacters();
  Future<MCharacter?> getCharacterDetails(String id);
}
