import 'package:second_task/modules/characters/data/models/m_characters.dart';

abstract class RepoCharacters {
  Future<List<MCharacters>> getAllCharacters();
  Future<MCharacters> getCharacterDetails(String id);
}
