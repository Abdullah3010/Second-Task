import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:second_task/core/utils/helpers/helper_hive.dart';
import 'package:second_task/modules/characters/data/models/m_characters.dart';

class BoxCharacters {
  late Box<MCharacters> _box;

  final String _boxName = 'box_characters';

  /// [box] is the box for the characters.
  Box<MCharacters> get box => _box;

  /// [init] initializes the box for the characters.
  Future<void> init() async {
    _box = await HelperHive.tryInitBox<MCharacters>(_boxName);
    debugPrint('Hive.Box.open: $_boxName -- Length: ${_box.length}');
  }
}
