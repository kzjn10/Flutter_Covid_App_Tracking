import 'package:corona_virus_app/domain/entities/global_entity.dart';

class SummaryEntity {
  GlobalEntity global;
  String status;

  SummaryEntity({this.global, this.status});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (global != null) {
      data['data'] = global.toJson();
    }
    data['status'] = status;
    return data;
  }

  String getFormattedTotalCase() {
    return (global?.totalCases ?? '').replaceAll(',', '.');
  }

  String getFormattedTotalDeaths() {
    return (global?.deathCases ?? '').replaceAll(',', '.');
  }

  String getFormattedTotalRecoveries() {
    return (global?.recoveryCases ?? '').replaceAll(',', '.');
  }
}
