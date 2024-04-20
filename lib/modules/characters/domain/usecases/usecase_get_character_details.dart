import 'package:second_task/core/utils/usecases/base_usecase.dart';
import 'package:second_task/modules/characters/data/models/m_character.dart';
import 'package:second_task/modules/characters/data/repo_imp/repo_characters.dart';

class UsecaseGetCharacterDetails extends BaseUseCase<Future<MCharacter>, String> {
  final RepoCharacters repo;

  UsecaseGetCharacterDetails({
    required this.repo,
  });

  @override
  Future<MCharacter> call(String input) => repo.getCharacterDetails(input);
}
