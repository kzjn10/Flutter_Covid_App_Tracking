part of 'corona_bloc.dart';

abstract class CoronaState {}

class InitState extends CoronaState {}

class FetchReportState extends CoronaState {}

class LoadedReportState extends CoronaState {
  final List<ReportEntity> data;

  LoadedReportState({this.data});
}

class FetchSummaryState extends CoronaState {}

class FailToLoadReportState extends CoronaState {}

class LoadedSummaryState extends CoronaState {
  final SummaryEntity summary;

  LoadedSummaryState({this.summary});
}

class FailToLoadSummaryState extends CoronaState {}

class NetworkExceptionState extends CoronaState {}

class FetchCountryReportState extends CoronaState {}

class LoadedCountryReportState extends CoronaState {
  final ReportEntity data;

  LoadedCountryReportState({this.data});
}

class FailToLoadCountryReportState extends CoronaState {}
