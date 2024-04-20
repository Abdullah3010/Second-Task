import 'package:second_task/modules/characters/data/models/m_character.dart';
import 'package:second_task/modules/characters/data/sources/local_data_source/box_characters.dart';
import 'package:second_task/modules/characters/data/sources/local_data_source/local_characters.dart';

class LocalCharactersImp implements LocalCharacters {
  final BoxCharacters boxCharacters;

  LocalCharactersImp({
    required this.boxCharacters,
  });

  @override
  Future<void> clear() async {
    await boxCharacters.box.clear();
  }

  @override
  List<MCharacter>? getAll() {
    return boxCharacters.box.values.toList();
  }

  @override
  Future<void> setAll(List<MCharacter> characters) async {
    await boxCharacters.box
        .putAll(<String, MCharacter>{for (var character in characters) character.id ?? '': character});
  }
}
