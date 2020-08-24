import 'package:corona_virus_app/domain/entities/country_info_entity.dart';

class CountryInfoModel extends CountryInfoEntity {
  CountryInfoModel({
    int id,
    String iso2,
    String iso3,
    double lat,
    double long,
    String flag,
  }) : super(
          id: id,
          iso2: iso2,
          iso3: iso3,
          lat: lat,
          long: long,
          flag: flag,
        );

  CountryInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    lat = (json['lat'] ?? 0).toDouble();
    long = (json['long'] ?? 0).toDouble();
    flag = json['flag'];
  }
}
