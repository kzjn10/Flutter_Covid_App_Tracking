import 'package:corona_virus_app/common/exceptions/network_connection_exception.dart';
import 'package:corona_virus_app/common/network/network_info.dart';
import 'package:corona_virus_app/data/datasources/remote/corona_remote_datasource.dart';
import 'package:corona_virus_app/domain/entities/report_entity.dart';
import 'package:corona_virus_app/domain/entities/summary_entity.dart';
import 'package:corona_virus_app/domain/repositories/corona_repository.dart';

class CoronaRepositoryImpl extends CoronaRepository {
  final NetworkInfoImpl networkInfo;
  final CoronaRemoteDataSource coronaRemoteDataSource;

  CoronaRepositoryImpl(this.networkInfo, this.coronaRemoteDataSource);

  @override
  Future<List<ReportEntity>> getReportData() async {
    if (await networkInfo.isConnected) {
      return coronaRemoteDataSource.getReportData();
    }
    throw NetworkConnectionException();
  }

  @override
  Future<SummaryEntity> getSummary() async {
    if (await networkInfo.isConnected) {
      return coronaRemoteDataSource.getSummary();
    }
    throw NetworkConnectionException();
  }

  @override
  Future<ReportEntity> getLocalReportData() async {
    if (await networkInfo.isConnected) {
      final reportList = await getReportData();
      return reportList.firstWhere((element) => element.country == 'Vietnam',
          orElse: () => null);
    }
    throw NetworkConnectionException();
  }
}
