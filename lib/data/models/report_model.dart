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
    int casesPerOneMillion,
    int deathsPerOneMillion,
    int totalTests,
    int testsPerOneMillion,
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
    casesPerOneMillion = json['casesPerOneMillion'];
    deathsPerOneMillion = json['deathsPerOneMillion'];
    totalTests = json['totalTests'];
    testsPerOneMillion = json['testsPerOneMillion'];
  }
}
