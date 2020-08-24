import 'package:corona_virus_app/data/models/country_info_model.dart';
import 'package:corona_virus_app/domain/entities/report_entity.dart';

class ReportModel extends ReportEntity {
  ReportModel({
    String country,
    int cases,
    int todayCases,
    int deaths,
    int todayDeaths,
    int recovered,
    int active,
    int critical,
    double casesPerOneMillion,
    double deathsPerOneMillion,
    int totalTests,
    double testsPerOneMillion,
    int updated,
    CountryInfoModel countryInfo,
  }) : super(
          country: country,
          cases: cases,
          todayCases: todayCases,
          deaths: deaths,
          todayDeaths: todayDeaths,
          recovered: recovered,
          active: active,
          critical: critical,
          casesPerOneMillion: casesPerOneMillion,
          deathsPerOneMillion: deathsPerOneMillion,
          totalTests: totalTests,
          testsPerOneMillion: testsPerOneMillion,
          updated: updated,
          countryInfo: countryInfo,
        );

  ReportModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    active = json['active'];
    critical = json['critical'];
    casesPerOneMillion = (json['casesPerOneMillion'] ?? 0).toDouble();
    deathsPerOneMillion = (json['deathsPerOneMillion'] ?? 0).toDouble();
    totalTests = json['totalTests'];
    testsPerOneMillion = (json['testsPerOneMillion'] ?? 0).toDouble();
    updated = json['updated'];
    if (json.containsKey('countryInfo')) {
      countryInfo = CountryInfoModel.fromJson(json['countryInfo']);
    }
  }
}
