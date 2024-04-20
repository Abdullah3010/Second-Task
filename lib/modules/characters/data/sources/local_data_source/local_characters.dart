import 'package:second_task/modules/characters/data/models/m_characters.dart';

abstract class LocalCharacters {
  Future<void> delete();

  MCharacters? get();

  Future<MCharacters> set(MCharacters user);
}
