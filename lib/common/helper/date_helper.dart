import 'package:aufguss_event_app/common/helper/locale_helper.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateHelper {
  const DateHelper._();

  static String formatDate(
    DateTime date, {
    String local = 'ja_JP',
  }) =>
      DateHelper.format(
        date,
        format: LocaleHelper.isJapanese() ? 'yyyy.MM.dd (E)' : 'MM.dd yyyy (E)',
        local: local,
        isJapanese: LocaleHelper.isJapanese(),
      );

  static String formatYYYYMMddHHmm(
    DateTime date, {
    bool dayOfWeek = false,
  }) =>
      DateHelper.format(date, dayOfWeek: dayOfWeek, second: false);

  static String format(
    DateTime date, {
    String? format,
    String local = 'ja_JP',
    bool isJapanese = true,
    bool year = true,
    bool month = true,
    bool day = true,
    bool dayOfWeek = true,
    bool hour = true,
    bool minute = true,
    bool second = true,
  }) {
    var f = '';
    if (format != null && format.isNotEmpty) {
      f = format;
    } else {
      if (year) {
        f += 'yyyy';
      }
      if (month) {
        f += '/MM';
      }
      if (day) {
        f += '/dd';
      }
      if (dayOfWeek) {
        f += '(E)';
      }
      if (hour) {
        f += ' HH';
      }
      if (minute) {
        f += ':mm';
      }
      if (second) {
        f += ':ss';
      }
    }
    initializeDateFormatting(local);
    final formatter = DateFormat(f, local);
    return formatter.format(date);
  }

  static DateTime milliToDate(int millisecondsSinceEpoch) {
    return DateTime.fromMicrosecondsSinceEpoch(millisecondsSinceEpoch * 1000);
  }

  static String dateToString(DateTime date, String format) {
    return DateFormat(format).format(date);
  }

  static String milliToString(int millisecondsSinceEpoch, String format) {
    return DateFormat(format)
        .format(DateHelper.milliToDate(millisecondsSinceEpoch));
  }

  static DateTime getDateTime(String value) {
    final dateFormatter = DateFormat('y/M/d HH:mm:ss');
    return dateFormatter.parseStrict(value);
  }

  static DateTime date({
    required int year,
    required int month,
    required int day,
    int hour = 0,
    int minute = 0,
    int second = 0,
  }) {
    final date = DateTime(year, month, day, hour, minute, second);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime dateOfFirstDay(int year, int month) {
    final date = DateTime(
      year,
      month,
    );
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime dateOfLastDay(int year, int month) {
    final date = DateTime(year, month + 1, 0);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime dateOfNowFirstDay() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime dateOfNowFirstTime() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime dateOfNowLastTime() {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day + 1);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static DateTime setDate(int year, int month) {
    final date = DateTime(year, month);
    return date.add(date.timeZoneOffset).toUtc();
  }

  static int diffHour(DateTime a, DateTime b) => a.difference(b).inHours;
  static int diffMinutes(DateTime a, DateTime b) => a.difference(b).inMinutes;

  // d1 >= d2 => true
  // d1 < d2 => false
  static bool isCompare(DateTime d1, DateTime d2) {
    if (d1.toUtc().compareTo(d2.toUtc()) != -1) {
      return true;
    } else {
      return false;
    }
  }

  // d1 == d2 => true
  // d1 != d2 => false
  static bool isEqual(DateTime d1, DateTime d2) {
    if (d1.toUtc().compareTo(d2.toUtc()) == 0) {
      return true;
    } else {
      return false;
    }
  }

  static String getMonthlyString(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
    }
    return '';
  }
}
