import 'package:dio/dio.dart';
import 'package:second_task/core/services/network/api_end_points/api_end_points.dart';
import 'package:second_task/core/services/network/config/base_dio.dart';
import 'package:second_task/core/utils/helpers/app_alert.dart';
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
        return response.data.map<MCharacter>((character) => MCharacter.fromJson(character));
      } else {
        AppAlert.error('There is no data');
      }
    } catch (e) {
      AppAlert.error('Can\'t get characters');
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
    } catch (e) {
      AppAlert.error('Can\'t get this character');
    }
    return null;
  }
}
