import 'package:corona_virus_app/domain/entities/report_entity.dart';
import 'package:corona_virus_app/domain/repositories/corona_repository.dart';

class CoronaUseCase {
  final CoronaRepository coronaRepository;

  CoronaUseCase({this.coronaRepository});

  Future<ReportEntity> getSummary() async {
    return coronaRepository.getSummary();
  }

  Future<List<ReportEntity>> getReport() async {
    return coronaRepository.getReportData();
  }

  Future<ReportEntity> getLocalReport() async {
    return coronaRepository.getLocalReportData();
  }
}
