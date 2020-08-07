import 'package:kiwi/kiwi.dart';

import 'package:corona_virus_app/common/network/http/corona_client.dart';
import 'package:corona_virus_app/common/network/network_info.dart';
import 'package:corona_virus_app/data/datasources/remote/corona_remote_datasource.dart';
import 'package:corona_virus_app/data/repositories/corona_repository_impl.dart';
import 'package:corona_virus_app/domain/usecases/corona_usecase.dart';
import 'package:corona_virus_app/presentation/common_bloc/corona_bloc/corona_bloc.dart';
import 'package:corona_virus_app/presentation/common_bloc/language_bloc/language_bloc.dart';
import 'package:corona_virus_app/presentation/common_bloc/timer_bloc/ticker.dart';
import 'package:corona_virus_app/presentation/common_bloc/timer_bloc/timer_bloc.dart';

part 'injector_config.g.dart';

abstract class InjectorConfig {
  static KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    final injector = _$InjectorConfig();
    // ignore: cascade_invocations
    injector._configure();
  }

  // ignore: type_annotate_public_apis
  static final resolve = container.resolve;

  void _configure() {
    _configureInsuranceModule();
  }

  void _configureInsuranceModule() {
    _configureBlocs();
    _configureUseCases();
    _configureRepositories();
    _configureDataSources();
    _configureExternal();
    _configureCommon();
    _configureUtils();
  }

  @Register.factory(CoronaBloc)
  @Register.factory(TimerBloc)
  @Register.singleton(LanguageBloc)
  void _configureBlocs();

  @Register.factory(CoronaUseCase)
  void _configureUseCases();

  @Register.factory(MovieRepositoryImpl)
  void _configureRepositories();

  @Register.factory(CoronaRemoteDataSource)
  void _configureDataSources();

  @Register.singleton(CoronaClient)
  void _configureExternal();

  @Register.factory(NetworkInfoImpl)
  void _configureCommon();

  @Register.singleton(Ticker)
  void _configureUtils();
}
