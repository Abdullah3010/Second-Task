import 'package:second_task/core/utils/usecases/base_usecase.dart';
import 'package:second_task/modules/characters/data/models/m_characters.dart';
import 'package:second_task/modules/characters/data/repo_imp/repo_characters.dart';

class UsecaseGetCharacterDetails extends BaseUseCase<Future<MCharacters>, String> {
  final RepoCharacters repo;

  UsecaseGetCharacterDetails({
    required this.repo,
  });

  @override
  Future<MCharacters> call(String input) => repo.getCharacterDetails(input);
}
