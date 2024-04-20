import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:second_task/core/widgets/w_no_data.dart';
import 'package:second_task/core/widgets/w_shared_scaffold.dart';
import 'package:second_task/modules/characters/data/models/m_character.dart';
import 'package:second_task/modules/characters/presentation/state_managment/characters_cubit.dart';
import 'package:second_task/modules/characters/presentation/widgets/w_character_item.dart';

class SNCharactersList extends StatefulWidget {
  const SNCharactersList({super.key});

  @override
  State<SNCharactersList> createState() => _SNCharactersListState();
}

class _SNCharactersListState extends State<SNCharactersList> {
  final CharactersCubit cubit = Modular.get<CharactersCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CharactersCubit>(
      create: (context) => cubit,
      child: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          return WSharedScaffold(
            withBackButton: false,
            title: 'Characters List',
            isLoading: state is CharactersLoading,
            body: state is CharactersError
                ? const WNoData()
                : state is CharactersSuccess
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: cubit.characters?.length ?? 0,
                        itemBuilder: (context, index) => WCharacterItem(
                          character: cubit.characters?[index] ?? MCharacter(),
                        ),
                      )
                    : const SizedBox(),
          );
        },
      ),
    );
  }
}
