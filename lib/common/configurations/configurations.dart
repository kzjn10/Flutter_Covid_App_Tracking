import 'default_env.dart';

class Configurations {
  static String _host = DefaultConfig.host;

  Future<void> setConfigurationValues(Map<String, dynamic> value) async {
    _host = value['host'] ?? DefaultConfig.host;
  }

  static String get host => _host;
}
