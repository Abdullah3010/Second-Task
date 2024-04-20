import 'package:second_task/core/utils/usecases/base_usecase.dart';
import 'package:second_task/core/utils/usecases/no_params.dart';
import 'package:second_task/modules/characters/data/models/m_characters.dart';
import 'package:second_task/modules/characters/data/repo_imp/repo_characters.dart';

class UsecaseGetAllCharacters extends BaseUseCase<Future<List<MCharacters>>, NoParam> {
  final RepoCharacters repo;

  UsecaseGetAllCharacters({
    required this.repo,
  });

  @override
  Future<List<MCharacters>> call(NoParam input) => repo.getAllCharacters();
}
