class Configurations {
  static String _host = '';

  Future<void> setConfigurationValues(Map<String, dynamic> value) async {
    _host = value['host'] ?? '';
  }

  static String get host => _host;
}
