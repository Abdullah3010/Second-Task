import 'package:dio/dio.dart';
import 'package:second_task/core/extension/stack_trace_extension.dart';
import 'package:second_task/core/services/network/api_end_points/api_end_points.dart';
import 'package:second_task/core/services/network/config/base_dio.dart';
import 'package:second_task/core/utils/enums/enums.dart';
import 'package:second_task/core/utils/helpers/app_alert.dart';
import 'package:second_task/core/utils/helpers/error_helper.dart';
import 'package:second_task/modules/characters/data/models/m_character.dart';
import 'package:second_task/modules/characters/data/sources/remote_data_source/remote_characters.dart';

class RemoteCharactersImp implements RemoteCharacters {
  final BaseDio dio;

  RemoteCharactersImp({
    required this.dio,
  });

  @override
  Future<List<MCharacter>?> getAllCharacters() async {
    try {
      final Response response = await dio.get(
        APIEndPoints.characters.getAllCharacters,
      );
      if (response.data != null) {
        return response.data.map<MCharacter>((character) => MCharacter.fromJson(character)).toList();
      } else {
        AppAlert.error('There is no data');
      }
    } catch (e, stackTrace) {
      AppAlert.error('Can\'t get characters');
      ErrorHelper.printDebugError(
        error: e,
        name: 'RemoteCharactersImp.getAllCharacters',
        stackTrace: stackTrace.limitStackTracePrint(),
        level: ErrorLevels.CRITICAL,
      );
    }
    return null;
  }

  @override
  Future<MCharacter?> getCharacterDetails(String id) async {
    try {
      final Response response = await dio.get(
        APIEndPoints.characters.getCharacter(id),
      );
      if (response.data != null) {
        return MCharacter.fromJson(response.data);
      } else {
        AppAlert.error('There is no data');
      }
    } catch (e, stackTrace) {
      AppAlert.error('Can\'t get this character');
      ErrorHelper.printDebugError(
        error: e,
        name: 'getCharacterDetails.getAllCharacters',
        stackTrace: stackTrace.limitStackTracePrint(),
        level: ErrorLevels.CRITICAL,
      );
    }
    return null;
  }
}
