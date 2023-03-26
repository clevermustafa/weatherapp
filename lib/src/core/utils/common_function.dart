import 'package:intl/intl.dart';

DateTime stringToDateTime(String dateTime) {
var parseddateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime, true);
return parseddateTime;
}
String getDayFromDateTime(DateTime dateTime) {
  if (dateTime.weekday == 1) {
    return "Mon";
  } else if (dateTime.weekday == 2) {
    return "Tue";
  } else if (dateTime.weekday == 3) {
    return "Wed";
  } else if (dateTime.weekday == 4) {
    return "Thu";
  } else if (dateTime.weekday == 5) {
    return "Fri";
  } else if (dateTime.weekday == 6) {
    return "Sat";
  } else if (dateTime.weekday == 7) {
    return "Sun";
  }
  return '';
}

String parseHours(DateTime dateTime) {
  final f =  DateFormat('hh:mm');
  return f.format(dateTime);
}

String parseHoursAMPM(DateTime dateTime) {
  final f =  DateFormat('hh:mm aa');
  return f.format(dateTime);
}

String parseTime(DateTime dateTime) {
  return DateFormat.jm().format(dateTime);
}
String parseDay(DateTime dateTime) {
  return DateFormat(DateFormat.DAY).format(dateTime);
}
String returnMonth(DateTime date) {
  return  DateFormat.MMMM().format(date);
}

String getDate(DateTime dateTime) {
  return DateFormat("yyyy-MM-dd").format(dateTime);
}
DateTime getDateFromEpoch(int date) {
  return DateTime.fromMillisecondsSinceEpoch(date).toLocal();
}

String getDayDateAndMonFomString(String date) {
  final datetime = stringToDateTime(date);
  final daydate = parseDay(datetime);
  final day = getDayFromDateTime(datetime);
  final month = returnMonth(datetime);
  return "$daydate $month $day";
}