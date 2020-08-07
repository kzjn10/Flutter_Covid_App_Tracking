import 'package:corona_virus_app/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:corona_virus_app/common/constants/language_constants.dart';
import 'package:corona_virus_app/common/constants/router_constants.dart';
import 'package:corona_virus_app/common/injector/injector.dart';
import 'package:corona_virus_app/common/internationalization.dart';
import 'package:corona_virus_app/presentation/common_bloc/timer_bloc/timer_bloc.dart';
import 'package:corona_virus_app/presentation/routes.dart';
import 'package:corona_virus_app/presentation/theme/theme_color.dart';

import 'common_bloc/language_bloc/language_bloc.dart';

class CoronaVirusApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: MultiBlocProvider(
        providers: _getProviders(),
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Corona Tracking App',
              initialRoute: RouteName.initial,
              onGenerateRoute: Routes.generateRoute,
              theme: appTheme(context),
              localizationsDelegates: [
                SLocalizationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (locale, supportedLocales) {
                if (locale == null) {
                  return supportedLocales.first;
                }

                for (final supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              supportedLocales: const [
                Locale(LanguageConstants.vietnamese, 'VN'),
              ],
            );
          },
        ),
      ),
    );
  }

  List<BlocProvider> _getProviders() => [
        BlocProvider<LanguageBloc>(
            create: (BuildContext context) => Injector.resolve<LanguageBloc>()),
        BlocProvider<TimerBloc>(
            create: (BuildContext context) => Injector.resolve<TimerBloc>()),
      ];
}
