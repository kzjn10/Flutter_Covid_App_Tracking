import 'dart:math';

import 'package:intl/intl.dart';

extension DoubleExtensions on double {
  bool isNotNullAndPositive() => this != null && this > 0;

  double toPercentUpperBound() {
    return this > 1 ? 1 : this;
  }
}

extension Precision on double {
  double toPrecision(int fractionDigits) {
    final double mod = pow(10, fractionDigits.toDouble());
    return (this * mod).round().toDouble() / mod;
  }
}

extension IntExtensions on int {
  String toFormattedValue() {
    final formatNumber = NumberFormat('#,###,###');
    return formatNumber.format(this).replaceAll(',', '.');
  }
}
