import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:corona_virus_app/presentation/app.dart';
import 'package:corona_virus_app/common/injector/injector_config.dart';
import 'package:corona_virus_app/presentation/common_bloc/supervisor_bloc/supervisor_bloc.dart';

Future<void> main() async {
  InjectorConfig.setup();
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(
            CoronaVirusApp(),
          ));
}
