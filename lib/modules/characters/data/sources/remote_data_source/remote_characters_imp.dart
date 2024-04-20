import 'package:second_task/core/services/network/config/base_dio.dart';
import 'package:second_task/modules/characters/data/sources/remote_data_source/remote_characters.dart';

class RemoteCharactersImp implements RemoteCharacters {
  final BaseDio dio;

  RemoteCharactersImp({
    required this.dio,
  });
}
