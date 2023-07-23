import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:intl/intl.dart';

abstract class PriceFormat {

  static String formatPrice(Decimal price) {
    return NumberFormat.simpleCurrency(
        decimalDigits: 2, name: '\u20bd', locale: 'ru')
        .format(DecimalIntl(price));
  }

}