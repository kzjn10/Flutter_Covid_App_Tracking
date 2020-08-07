import 'package:corona_virus_app/domain/entities/country_entity.dart';

class CountryModel extends CountryEntity {
  CountryModel({
    String country,
    String countryCode,
    String slug,
    int newConfirmed,
    int totalConfirmed,
    int newDeaths,
    int totalDeaths,
    int newRecovered,
    int totalRecovered,
    String date,
  }) : super(
          country: country,
          countryCode: countryCode,
          slug: slug,
          newConfirmed: newConfirmed,
          totalConfirmed: totalConfirmed,
          newDeaths: newDeaths,
          totalDeaths: totalDeaths,
          newRecovered: newRecovered,
          totalRecovered: totalRecovered,
          date: date,
        );

  CountryModel.fromJson(Map<String, dynamic> json) {
    country = json['Country'];
    countryCode = json['CountryCode'];
    slug = json['Slug'];
    newConfirmed = json['NewConfirmed'];
    totalConfirmed = json['TotalConfirmed'];
    newDeaths = json['NewDeaths'];
    totalDeaths = json['TotalDeaths'];
    newRecovered = json['NewRecovered'];
    totalRecovered = json['TotalRecovered'];
    date = json['Date'];
  }
}
