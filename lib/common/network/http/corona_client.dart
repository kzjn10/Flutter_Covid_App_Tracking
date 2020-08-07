import 'package:corona_virus_app/common/configurations/configurations.dart';

import 'http_client.dart';

class CoronaClient extends HttpClient {
  CoronaClient()
      : super(
          host: Configurations.host,
          header: getAuthenticationHeader(),
        );

  static Map<String, String> getAuthenticationHeader() {
    return {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }
}
