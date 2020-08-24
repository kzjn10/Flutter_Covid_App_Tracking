import 'package:corona_virus_app/domain/entities/report_entity.dart';

abstract class CoronaRepository {
  Future<ReportEntity> getSummary();

  Future<List<ReportEntity>> getReportData();

  Future<ReportEntity> getLocalReportData();
}
