import 'package:second_task/core/extension/stack_trace_extension.dart';
import 'package:second_task/core/utils/enums/enums.dart';
import 'package:second_task/core/utils/helpers/error_helper.dart';
import 'package:second_task/modules/characters/data/models/m_character.dart';
import 'package:second_task/modules/characters/domain/repos/repo_characters.dart';
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
  Future<List<MCharacter>> getAllCharacters() async {
    try {
      final List<MCharacter>? characters = await remoteCharacters.getAllCharacters();
      if (characters != null) {
        await localCharacters.clear();
        await localCharacters.setAll(characters);
        return characters;
      } else {
        return localCharacters.getAll() ?? [];
      }
    } catch (e, stackTrace) {
      ErrorHelper.printDebugError(
        error: e,
        name: 'RepoCharactersImp.getAllCharacters',
        stackTrace: stackTrace.limitStackTracePrint(),
        level: ErrorLevels.CRITICAL,
      );
      return [];
    }
  }

  @override
  Future<MCharacter> getCharacterDetails(String id) async {
    try {
      final MCharacter? character = await remoteCharacters.getCharacterDetails(id);
      if (character != null) {
        return character;
      } else {
        return localCharacters.getAll()!.firstWhere((element) => element.id == id);
      }
    } catch (e, stackTrace) {
      ErrorHelper.printDebugError(
        error: e,
        name: 'RepoCharactersImp.getCharacterDetails',
        stackTrace: stackTrace.limitStackTracePrint(),
        level: ErrorLevels.CRITICAL,
      );
      return localCharacters.getAll()!.firstWhere((element) => element.id == id);
    }
  }
}
