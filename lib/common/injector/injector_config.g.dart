// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector_config.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$InjectorConfig extends InjectorConfig {
  void _configureBlocs() {
    KiwiContainer()
      ..registerSingleton((c) => LanguageBloc())
      ..registerFactory((c) => CoronaBloc(coronaUseCase: c<CoronaUseCase>()))
      ..registerFactory((c) => TimerBloc(ticker: c<Ticker>()));
  }

  void _configureUseCases() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory(
        (c) => CoronaUseCase(coronaRepository: c<MovieRepositoryImpl>()));
  }

  void _configureRepositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) =>
        MovieRepositoryImpl(c<NetworkInfoImpl>(), c<CoronaRemoteDataSource>()));
  }

  void _configureDataSources() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory(
        (c) => CoronaRemoteDataSource(coronaClient: c<CoronaClient>()));
  }

  void _configureExternal() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => CoronaClient());
  }

  void _configureCommon() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => NetworkInfoImpl());
  }

  void _configureUtils() {
    final KiwiContainer container = KiwiContainer();
    container.registerFactory((c) => Ticker());
  }
}
