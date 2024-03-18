import 'package:intl/intl.dart';

class Constants{
  static List<String> weekdays = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }
}