part of 'corona_bloc.dart';

abstract class CoronaEvent {
  bool isFromRemote;

  CoronaEvent({this.isFromRemote});
}

class FetchSummaryEvent extends CoronaEvent {
  FetchSummaryEvent({bool fromRemote = true}) : super(isFromRemote: fromRemote);
}

class FetchReportEvent extends CoronaEvent {
  FetchReportEvent({bool fromRemote = true}) : super(isFromRemote: fromRemote);
}

class FetchCountryReportEvent extends CoronaEvent {
  FetchCountryReportEvent({bool fromRemote = true})
      : super(isFromRemote: fromRemote);
}
