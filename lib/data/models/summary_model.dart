import 'package:corona_virus_app/data/models/global_model.dart';
import 'package:corona_virus_app/domain/entities/summary_entity.dart';

class SummaryModel extends SummaryEntity {
  SummaryModel({
    GlobalModel global,
    String status,
  });

  SummaryModel.fromJson(Map<String, dynamic> json) {
    global = json['data'] != null ? GlobalModel.fromJson(json['data']) : null;
    status = json['status'];
  }
}
