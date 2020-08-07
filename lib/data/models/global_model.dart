import 'package:corona_virus_app/domain/entities/global_entity.dart';

class GlobalModel extends GlobalEntity {
  GlobalModel({
    String totalCases,
    String recoveryCases,
    String deathCases,
    String lastUpdate,
    String currentlyInfected,
    String casesWithOutcome,
    String mildConditionActiveCases,
    String criticalConditionActiveCases,
    String recoveredClosedCases,
    String deathClosedCases,
    String closedCasesRecoveredPercentage,
    String closedCasesDeathPercentage,
    String activeCasesMildPercentage,
    String activeCasesCriticalPercentage,
    String generalDeathRate,
  }) : super(
          totalCases: totalCases,
          recoveryCases: recoveryCases,
          deathCases: deathCases,
          lastUpdate: lastUpdate,
          currentlyInfected: currentlyInfected,
          casesWithOutcome: casesWithOutcome,
          mildConditionActiveCases: mildConditionActiveCases,
          criticalConditionActiveCases: criticalConditionActiveCases,
          recoveredClosedCases: recoveredClosedCases,
          deathClosedCases: deathClosedCases,
          closedCasesRecoveredPercentage: closedCasesRecoveredPercentage,
          closedCasesDeathPercentage: closedCasesDeathPercentage,
          activeCasesMildPercentage: activeCasesMildPercentage,
          activeCasesCriticalPercentage: activeCasesCriticalPercentage,
          generalDeathRate: generalDeathRate,
        );

  GlobalModel.fromJson(Map<String, dynamic> json) {
    totalCases = json['total_cases'];
    recoveryCases = json['recovery_cases'];
    deathCases = json['death_cases'];
    lastUpdate = json['last_update'];
    currentlyInfected = json['currently_infected'];
    casesWithOutcome = json['cases_with_outcome'];
    mildConditionActiveCases = json['mild_condition_active_cases'];
    criticalConditionActiveCases = json['critical_condition_active_cases'];
    recoveredClosedCases = json['recovered_closed_cases'];
    deathClosedCases = json['death_closed_cases'];
    closedCasesRecoveredPercentage = json['closed_cases_recovered_percentage'];
    closedCasesDeathPercentage = json['closed_cases_death_percentage'];
    activeCasesMildPercentage = json['active_cases_mild_percentage'];
    activeCasesCriticalPercentage = json['active_cases_critical_percentage'];
    generalDeathRate = json['general_death_rate'];
  }
}
