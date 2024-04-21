import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task/core/extension/color_extension.dart';
import 'package:second_task/core/extension/context_extension.dart';
import 'package:second_task/core/extension/int_extension.dart';
import 'package:second_task/core/extension/text_theme_extension.dart';
import 'package:second_task/core/widgets/w_no_data.dart';
import 'package:second_task/core/widgets/w_shared_network_image.dart';
import 'package:second_task/core/widgets/w_shared_scaffold.dart';
import 'package:second_task/modules/characters/presentation/state_managment/characters_cubit.dart';

class SNCharacterDetails extends StatefulWidget {
  const SNCharacterDetails({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<SNCharacterDetails> createState() => _SNCharacterDetailsState();
}

class _SNCharacterDetailsState extends State<SNCharacterDetails> {
  final CharactersCubit cubit = Modular.get<CharactersCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getCharacterDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      bloc: cubit,
      builder: (context, state) {
        return WSharedScaffold(
          title: cubit.activeCharacter?.name ?? '',
          isLoading: state is CharactersLoading,
          paddingTop: 0,
          paddingLeft: 0,
          paddingRight: 0,
          onBackButtonTap: () {
            cubit.activeCharacter = null;
            Modular.to.pop();
          },
          body: state is CharactersError
              ? const WNoData()
              : state is CharactersSuccess
                  ? ListView(
                      padding: EdgeInsets.only(
                        top: 0,
                        bottom: 24.h,
                        left: 0,
                        right: 0,
                      ),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: context.theme.colorScheme.naturalColor700,
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: context.theme.colorScheme.shadowColor,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                            border: Border(
                              bottom: BorderSide(
                                color: context.theme.colorScheme.shadowColor,
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              WSharedNetworkImage(
                                imageUrl: cubit.activeCharacter?.image ?? '',
                                width: context.width,
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: context.width,
                                  height: 400.h,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        context.theme.colorScheme.naturalColor700,
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: context.width,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 22.w,
                                    vertical: 30.h,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cubit.activeCharacter?.name ?? '',
                                        style: context.textTheme.titleMedium_28,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        16.createVerticalGap(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'Actor: ',
                                  style: context.textTheme.titleMedium_18,
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: '${cubit.activeCharacter?.actor}',
                                      style: context.textTheme.bodyMedium_14,
                                    ),
                                  ],
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: 'House: ',
                                  style: context.textTheme.titleMedium_18,
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: '${cubit.activeCharacter?.house}',
                                      style: context.textTheme.bodyMedium_14,
                                    ),
                                  ],
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: 'Date of birth: ',
                                  style: context.textTheme.titleMedium_18,
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: '${cubit.activeCharacter?.dateOfBirth}',
                                      style: context.textTheme.bodyMedium_14,
                                    ),
                                  ],
                                ),
                              ),
                              16.createVerticalGap(),
                              Text(
                                'Alternate names',
                                style: context.textTheme.titleMedium_18,
                              ),
                              4.createVerticalGap(),
                              Text.rich(
                                TextSpan(
                                  children: List.generate(
                                    cubit.activeCharacter?.alternateNames?.length ?? 0,
                                    (index) => TextSpan(
                                      text: cubit.activeCharacter?.alternateNames?[index] ?? '',
                                      style: context.textTheme.bodyMedium_14,
                                      children: [
                                        TextSpan(
                                          text: ', ',
                                          style: context.textTheme.bodyMedium_14,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
        );
      },
    );
  }
}
