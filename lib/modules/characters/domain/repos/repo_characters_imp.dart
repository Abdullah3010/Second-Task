import 'package:second_task/modules/characters/data/models/m_character.dart';
import 'package:second_task/modules/characters/data/repo_imp/repo_characters.dart';
import 'package:second_task/modules/characters/data/sources/local_data_source/local_characters.dart';
import 'package:second_task/modules/characters/data/sources/remote_data_source/remote_characters.dart';

class RepoCharactersImp implements RepoCharacters {
  final RemoteCharacters remoteCharacters;
  final LocalCharacters localCharacters;

  RepoCharactersImp({
    required this.remoteCharacters,
    required this.localCharacters,
  });

  @override
  Future<List<MCharacter>> getAllCharacters() {
    // TODO: implement getAllCharacters
    throw UnimplementedError();
  }

  @override
  Future<MCharacter> getCharacterDetails(String id) {
    // TODO: implement getCharacterDetails
    throw UnimplementedError();
  }
}
