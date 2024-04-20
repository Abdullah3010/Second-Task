import 'package:flutter_modular/flutter_modular.dart';
import 'package:second_task/modules/characters/domain/repos/repo_characters.dart';
import 'package:second_task/modules/characters/data/sources/local_data_source/box_characters.dart';
import 'package:second_task/modules/characters/data/sources/local_data_source/local_characters.dart';
import 'package:second_task/modules/characters/data/sources/local_data_source/local_characters_imp.dart';
import 'package:second_task/modules/characters/data/sources/remote_data_source/remote_characters.dart';
import 'package:second_task/modules/characters/data/sources/remote_data_source/remote_characters_imp.dart';
import 'package:second_task/modules/characters/data/repo_imp/repo_characters_imp.dart';
import 'package:second_task/modules/characters/domain/usecases/usecase_get_all_characters.dart';
import 'package:second_task/modules/characters/domain/usecases/usecase_get_character_details.dart';
import 'package:second_task/modules/characters/domain/usecases/usecases_characters.dart';
import 'package:second_task/modules/characters/presentation/state_managment/characters_cubit.dart';

class BindCharacters {
  static void binds(Injector i) {
    /// Start [Characters] dependencies.
    /// [Box]
    i.addSingleton(BoxCharacters.new);

    /// [Data Sources]
    i.add<LocalCharacters>(LocalCharactersImp.new);
    i.add<RemoteCharacters>(RemoteCharactersImp.new);

    /// [Repo]
    i.add<RepoCharacters>(RepoCharactersImp.new);

    /// [Usecases]
    i.add(UsecaseGetCharacterDetails.new);
    i.add(UsecaseGetAllCharacters.new);
    i.add(UsecasesCharacters.new);

    /// [State Managment]
    i.addLazySingleton<CharactersCubit>(CharactersCubit.new);

    /// End [Characters] dependencies.
    /// [=================================================] ///
  }
}
