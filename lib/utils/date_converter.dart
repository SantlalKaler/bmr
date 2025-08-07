import 'package:intl/intl.dart';

class DateConverter {
  static String convertDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    String formattedDate = DateFormat(format).format(date);
    return formattedDate;
  }
}
