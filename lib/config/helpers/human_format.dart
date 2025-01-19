import 'package:intl/intl.dart';

class HumanFormat {
  static String number(double number, [int decimals = 0]) {
    final fomatterNumber = NumberFormat.compactCurrency(
      locale: 'en',
      decimalDigits: decimals,
      symbol: '',
    ).format(number);
    return fomatterNumber;
  }
}
