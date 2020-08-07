import 'package:flutter/material.dart';

import 'package:corona_virus_app/common/network/http/corona_client.dart';
import 'package:corona_virus_app/data/datasources/remote/constants/remote_constants.dart';
import 'package:corona_virus_app/data/models/report_model.dart';
import 'package:corona_virus_app/data/models/summary_model.dart';

class CoronaRemoteDataSource {
  final CoronaClient coronaClient;

  CoronaRemoteDataSource({@required this.coronaClient});

  Future<List<ReportModel>> getReportData() async {
    final response = await coronaClient.get(RemoteConstants.report);
    final data = <ReportModel>[];
    response.forEach((item) {
      data.add(ReportModel.fromJson(item));
    });

    return data;
  }

  Future<SummaryModel> getSummary() async {
    final response = await coronaClient.get(RemoteConstants.summary);
    return SummaryModel.fromJson(response);
  }
}
