import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:corona_virus_app/common/network/http_constants.dart';
import 'package:corona_virus_app/common/exceptions/server_error_exception.dart';
import 'package:corona_virus_app/common/utils/remote_utils.dart';

import 'package:http/http.dart';

class HttpUtil {
  static dynamic encodeRequestBody(dynamic data, String contentType) {
    return contentType == HttpConstants.jsonContentType
        ? utf8.encode(json.encode(data))
        : data;
  }

  static dynamic getResponse(Response response) {
    debugPrint('>>>>>>> ${response.body}');
    switch (response.statusCode) {
      case 200:
        return _getSuccessResponse(response);
      default:
        throw ServerErrorException(
          getErrorResult(json.decode(response.body)),
        );
    }
  }

  static dynamic _getSuccessResponse(Response response) {
    final _responseJson = json.decode(response.body);

    debugPrint('>>>>>>> [RESPONSE] $_responseJson');

    return _responseJson;
  }
}
