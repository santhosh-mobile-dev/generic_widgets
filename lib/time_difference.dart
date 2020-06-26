import 'package:timeago/timeago.dart' as timeago;

class TimeDifference {
  static String postAddedTimeDifference(int timeStamp) {
    DateTime now = DateTime.now();
    var date1 = new DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    final diff = now.difference(date1).inMilliseconds;
    final timeAgoDifference =
        new DateTime.now().subtract(new Duration(milliseconds: diff));
    return timeago.format(timeAgoDifference);
  }
}
