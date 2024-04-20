import 'package:flutter_modular/flutter_modular.dart';
import 'package:second_task/modules/characters/domain/usecases/usecase_get_all_characters.dart';
import 'package:second_task/modules/characters/domain/usecases/usecase_get_character_details.dart';

class UsecasesCharacters {
  final UsecaseGetAllCharacters getAllCharacters = Modular.get<UsecaseGetAllCharacters>();
  final UsecaseGetCharacterDetails getCharacterDetails = Modular.get<UsecaseGetCharacterDetails>();
}
