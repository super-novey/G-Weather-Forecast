import 'package:intl/intl.dart';

class Formatter {
  static String formatDateTime(DateTime date) {
    date = date.toLocal();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String formatTempC(double tempC) {
    return "$tempC °C";
  }

  static String formatWindSpeed(double windKph) {
    double windMps = windKph / 3.6;
    return "${windMps.toStringAsFixed(2)} M/S";
  }
}
