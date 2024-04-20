import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:second_task/app_bloc_observer.dart';
import 'package:second_task/core/services/routes/app_module.dart';
import 'package:second_task/modules/characters/data/models/m_character.dart';
import 'package:second_task/modules/core/presentation/screens/app_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await ScreenUtil.ensureScreenSize();

  Hive
    ..registerAdapter(MCharacterAdapter())
    ..registerAdapter(MWandAdapter());

  await Hive.initFlutter();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppCore(),
    ),
  );
}
