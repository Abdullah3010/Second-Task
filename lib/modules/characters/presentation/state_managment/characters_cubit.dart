import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:second_task/core/utils/usecases/no_params.dart';
import 'package:second_task/modules/characters/data/models/m_character.dart';
import 'package:second_task/modules/characters/domain/usecases/usecases_characters.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final UsecasesCharacters usecasesCharacters;

  CharactersCubit({
    required this.usecasesCharacters,
  }) : super(CharactersInitial());

  List<MCharacter>? characters;
  MCharacter? activeCharacter;

  Future<void> getAllCharacters() async {
    emit(CharactersLoading());
    characters = await usecasesCharacters.getAllCharacters(NoParam());
    if (characters != null) {
      emit(CharactersSuccess());
    } else {
      emit(CharactersError());
    }
  }

  Future<void> getCharacterDetails(String id) async {
    emit(CharactersLoading());
    activeCharacter = await usecasesCharacters.getCharacterDetails(id);
    if (activeCharacter != null) {
      emit(CharactersSuccess());
    } else {
      emit(CharactersError());
    }
  }
}
