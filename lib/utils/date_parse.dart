import 'package:intl/intl.dart';

/// Класс, который помогает в расчете и конвертации даты.
class DateParseUtil {
  static String convertUnixTimeToDateTime(int unixTime) {
    var date = DateTime.fromMillisecondsSinceEpoch((unixTime * 1000));

    return DateFormat.yMMMd().format(date);
  }

  static String convertUnixTimeToDayOfTheWeek(int unixTime) {
    var date = DateTime.fromMillisecondsSinceEpoch((unixTime * 1000));

    return DateFormat.EEEE().format(date);
  }
}
