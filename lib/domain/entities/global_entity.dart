import 'package:corona_virus_app/common/extensions/string_extension.dart';

class GlobalEntity {
  String totalCases;
  String recoveryCases;
  String deathCases;
  String lastUpdate;
  String currentlyInfected;
  String casesWithOutcome;
  String mildConditionActiveCases;
  String criticalConditionActiveCases;
  String recoveredClosedCases;
  String deathClosedCases;
  String closedCasesRecoveredPercentage;
  String closedCasesDeathPercentage;
  String activeCasesMildPercentage;
  String activeCasesCriticalPercentage;
  String generalDeathRate;

  GlobalEntity({
    this.totalCases,
    this.recoveryCases,
    this.deathCases,
    this.lastUpdate,
    this.currentlyInfected,
    this.casesWithOutcome,
    this.mildConditionActiveCases,
    this.criticalConditionActiveCases,
    this.recoveredClosedCases,
    this.deathClosedCases,
    this.closedCasesRecoveredPercentage,
    this.closedCasesDeathPercentage,
    this.activeCasesMildPercentage,
    this.activeCasesCriticalPercentage,
    this.generalDeathRate,
  });

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total_cases'] = totalCases;
    data['recovery_cases'] = recoveryCases;
    data['death_cases'] = deathCases;
    data['last_update'] = lastUpdate;
    data['currently_infected'] = currentlyInfected;
    data['cases_with_outcome'] = casesWithOutcome;
    data['mild_condition_active_cases'] = mildConditionActiveCases;
    data['critical_condition_active_cases'] = criticalConditionActiveCases;
    data['recovered_closed_cases'] = recoveredClosedCases;
    data['death_closed_cases'] = deathClosedCases;
    data['closed_cases_recovered_percentage'] = closedCasesRecoveredPercentage;
    data['closed_cases_death_percentage'] = closedCasesDeathPercentage;
    data['active_cases_mild_percentage'] = activeCasesMildPercentage;
    data['active_cases_critical_percentage'] = activeCasesCriticalPercentage;
    data['general_death_rate'] = generalDeathRate;
    return data;
  }

  double getCurrentInfectedPercent() {
    final infectedValue = (currentlyInfected ?? '0.0').getIntValue();
    final totalValue = (totalCases ?? '0.0').getIntValue();
    if (totalValue == 0 || infectedValue == 0) {
      return 0.0;
    }

    return infectedValue / totalValue * 100;
  }

  double getRecoveriesPercent() {
    final recoveriesValue = (recoveryCases ?? '0.0').getIntValue();
    final totalValue = (totalCases ?? '0.0').getIntValue();
    if (totalValue == 0 || recoveriesValue == 0) {
      return 0.0;
    }

    return recoveriesValue / totalValue * 100;
  }

  double getDeathPercent() {
    final deathValue = (deathCases ?? '0.0').getIntValue();
    final totalValue = (totalCases ?? '0.0').getIntValue();
    if (totalValue == 0 || deathValue == 0) {
      return 0.0;
    }

    return deathValue / totalValue * 100;
  }
}
