class CountryInfoEntity {
  int id;
  String iso2;
  String iso3;
  double lat;
  double long;
  String flag;

  CountryInfoEntity({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['iso2'] = iso2;
    data['iso3'] = iso3;
    data['lat'] = lat;
    data['long'] = long;
    data['flag'] = flag;
    return data;
  }
}
