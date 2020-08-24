import 'package:corona_virus_app/domain/entities/country_info_entity.dart';

class ReportEntity {
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  double casesPerOneMillion;
  double deathsPerOneMillion;
  int totalTests;
  double testsPerOneMillion;
  int updated;
  CountryInfoEntity countryInfo;

  ReportEntity({
    this.country,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.totalTests,
    this.testsPerOneMillion,
    this.updated,
    this.countryInfo,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['country'] = country;
    data['cases'] = cases;
    data['todayCases'] = todayCases;
    data['deaths'] = deaths;
    data['todayDeaths'] = todayDeaths;
    data['recovered'] = recovered;
    data['active'] = active;
    data['critical'] = critical;
    data['casesPerOneMillion'] = casesPerOneMillion;
    data['deathsPerOneMillion'] = deathsPerOneMillion;
    data['totalTests'] = totalTests;
    data['testsPerOneMillion'] = testsPerOneMillion;
    data['updated'] = updated;
    data['countryInfo'] = countryInfo.toJson();
    return data;
  }

  double getCurrentInfectedPercent() {
    return active / cases * 100;
  }

  double getRecoveriesPercent() {
    return recovered / cases * 100;
  }

  double getDeathPercent() {
    return deaths / cases * 100;
  }
}
