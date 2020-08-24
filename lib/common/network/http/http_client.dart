import 'package:meta/meta.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart';

import 'package:corona_virus_app/common/utils/http_util.dart';

class HttpClient {
  Client _client;
  String host;
  Map<String, String> header;

  HttpClient({@required this.host, @required this.header}) {
    _client = Client();
  }

  Uri _getParsedUrl(String path) {
    return Uri.parse('$host$path');
  }

  dynamic get(String path) async {
    debugPrint('>>>>>>> [GET] ${_getParsedUrl(path)}');

    final response = await _client.get(
      _getParsedUrl(path),
      headers: header,
    );

    return HttpUtil.getResponse(response);
  }
}
