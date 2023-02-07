import 'package:intl/intl.dart';

class DateTimeEx {
  static DateFormat dateFormat = DateFormat('d MMMM yyyy');
  static NumberFormat dateFormatEn = NumberFormat.decimalPattern('en_us');
  static DateTime converStringToDate(String date) => DateTime.parse(date);

  static DateTime converStringToDateTh(String date) {
    var dateValue = DateTime.parse(date);
    return DateTime(dateValue.year + 543, dateValue.month, dateValue.day);
  }
}
