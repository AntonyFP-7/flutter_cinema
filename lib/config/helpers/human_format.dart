import 'package:intl/intl.dart';

class HumanFormat {
  static String number(double number) {
    final fomatterNumber = NumberFormat.compactCurrency(
      locale: 'en',
      decimalDigits: 0,
      symbol: '',
    ).format(number);
    return fomatterNumber;
  }
}
