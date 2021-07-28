import 'package:intl/intl.dart';

class UtilDataHora {
  static DateTime convertStringToDate(String data) {
    try {
      return DateFormat("yyyy-MM-dd hh:mm:ss", 'en').parse(data);
    } catch (e) {
      return null;
    }
  }
}
