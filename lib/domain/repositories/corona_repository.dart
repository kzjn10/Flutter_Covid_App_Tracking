import 'package:corona_virus_app/domain/entities/report_entity.dart';
import 'package:corona_virus_app/domain/entities/summary_entity.dart';

abstract class CoronaRepository {
  Future<SummaryEntity> getSummary();

  Future<List<ReportEntity>> getReportData();

  Future<ReportEntity> getLocalReportData();
}
