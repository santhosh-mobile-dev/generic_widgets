import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class TimeDifference {
  static String postAddedTimeDifference(int timeStamp) {
    DateTime now = DateTime.now();
    var date1 = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    final diff = now.difference(date1).inMilliseconds;
    final timeDiff = DateTime.now().subtract(new Duration(milliseconds: diff));
    return timeago.format(timeDiff);
  }

  static String time(int timeStamp) {
    DateTime now = DateTime.parse(timeStamp.toString());
    var date1 = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    final diff = now.difference(date1).inMilliseconds;
    final timeDiff = DateTime.now().subtract(new Duration(milliseconds: diff));
    return DateFormat.jm().format(timeDiff);
  }

  static String date(int timeStamp) {
    var newFormat = DateFormat("MMM d");
    DateTime now = DateTime.now();
    var date1 = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    final diff = now.difference(date1).inMilliseconds;
    final dateDiff = DateTime.now().subtract(new Duration(milliseconds: diff));
    return newFormat.format(dateDiff);
  }
}
