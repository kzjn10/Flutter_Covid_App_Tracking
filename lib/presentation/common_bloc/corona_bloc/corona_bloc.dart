import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:corona_virus_app/domain/entities/report_entity.dart';
import 'package:corona_virus_app/domain/entities/summary_entity.dart';
import 'package:corona_virus_app/domain/usecases/corona_usecase.dart';

part 'corona_event.dart';
part 'corona_state.dart';

class CoronaBloc extends Bloc<CoronaEvent, CoronaState> {
  final CoronaUseCase coronaUseCase;

  CoronaBloc({this.coronaUseCase}) : super(InitMovieState());

  @override
  Stream<CoronaState> mapEventToState(CoronaEvent event) async* {
    switch (event.runtimeType) {
      case FetchSummaryEvent:
        yield* _mapFetchSummaryToState(event);
        break;
      case FetchReportEvent:
        yield* _mapFetchReportToState(event);
        break;
      case FetchCountryReportEvent:
        yield* _mapFetchCountryReportToState(event);
        break;
      default:
        break;
    }
  }

  Stream<CoronaState> _mapFetchSummaryToState(FetchSummaryEvent event) async* {
    try {
      yield FetchSummaryState();

      final summaryData = await coronaUseCase.getSummary();

      if (summaryData != null) {
        yield LoadedSummaryState(summary: summaryData);
      } else {
        yield FailToLoadSummaryState();
      }
    } on SocketException catch (_) {
      yield NetworkExceptionState();
    } catch (_) {
      yield FailToLoadSummaryState();
    }
  }

  Stream<CoronaState> _mapFetchReportToState(FetchReportEvent event) async* {
    try {
      yield FetchReportState();

      final reportData = await coronaUseCase.getReport();

      if (reportData != null) {
        reportData.removeAt(0);
        final x = reportData.sublist(0, 10);
        yield LoadedReportState(data: x);
      } else {
        yield FailToLoadReportState();
      }
    } on SocketException catch (_) {
      yield NetworkExceptionState();
    } catch (_) {
      yield FailToLoadReportState();
    }
  }

  Stream<CoronaState> _mapFetchCountryReportToState(
      FetchCountryReportEvent event) async* {
    try {
      yield FetchCountryReportState();

      final reportData = await coronaUseCase.getLocalReport();

      if (reportData != null) {
        yield LoadedCountryReportState(data: reportData);
      } else {
        yield FailToLoadCountryReportState();
      }
    } on SocketException catch (_) {
      yield NetworkExceptionState();
    } catch (_) {
      yield FailToLoadCountryReportState();
    }
  }
}
