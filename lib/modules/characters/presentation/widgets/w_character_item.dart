import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:second_task/core/extension/color_extension.dart';
import 'package:second_task/core/extension/context_extension.dart';
import 'package:second_task/core/extension/int_extension.dart';
import 'package:second_task/core/extension/text_theme_extension.dart';
import 'package:second_task/core/widgets/w_shared_network_image.dart';
import 'package:second_task/modules/characters/data/models/m_character.dart';

class WCharacterItem extends StatelessWidget {
  const WCharacterItem({
    super.key,
    required this.character,
  });
  final MCharacter character;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: EdgeInsets.only(
        bottom: 12.h,
      ),
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
        )),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WSharedNetworkImage(
            imageUrl: character.image ?? '',
            width: 100,
            height: 100,
          ),
          12.createHorizontalGap(),
          SizedBox(
            width: 220.w,
            height: 90.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name ?? '',
                  style: context.textTheme.titleMedium_18,
                ),
                const Spacer(),
                Text(
                  'Actor: ${character.actor}',
                  style: context.textTheme.bodyMedium_14,
                ),
                Text(
                  'House: ${character.house}',
                  style: context.textTheme.bodyMedium_14,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
