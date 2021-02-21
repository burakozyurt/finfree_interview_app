class DateConverter {
  String convertDateToStringWithParam(int endtime) {
    DateTime now = DateTime.now();

    DateTime roomdate = DateTime.fromMillisecondsSinceEpoch(endtime);
    if (now.day == roomdate.day) {
      return 'Bugün, ' +
          (roomdate.hour <= 9 ? '0' + roomdate.hour.toString() : roomdate.hour.toString()) +
          ':' +
          (roomdate.minute <= 9 ? '0' + roomdate.minute.toString() : roomdate.minute.toString());
    } else {
      return 'Yarın, ' +
          (roomdate.hour <= 9 ? '0' + roomdate.hour.toString() : roomdate.hour.toString()) +
          ':' +
          (roomdate.minute <= 9 ? '0' + roomdate.minute.toString() : roomdate.minute.toString());
    }
  }

  String convertDate(int endtime) {
    DateTime now = DateTime.now();

    DateTime roomdate = DateTime.fromMillisecondsSinceEpoch(endtime);
    return (roomdate.day <= 9 ? '0' + roomdate.day.toString() : roomdate.day.toString()) +
        '.' +
        (roomdate.month <= 9 ? '0' + roomdate.month.toString() : roomdate.month.toString()) +
        '.' +
        roomdate.year.toString();
  }

  String getHourRange(int endtime) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(endtime);
    int currentHour = date.hour;
    int lastHour;
    if (currentHour == 23) {
      lastHour = 0;
    } else {
      lastHour = currentHour + 1;
    }
    String range = (currentHour.toString().length == 1 ? '0' + currentHour.toString() : currentHour.toString()) +
        ':00 - ' +
        (lastHour.toString().length == 1 ? '0' + lastHour.toString() : lastHour.toString()) +
        ':00';
    return range;
  }

  String getHour(int endtime) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(endtime);
    int currentHour = date.hour;
    String range = (currentHour.toString().length == 1 ? '0' + currentHour.toString() : currentHour.toString()) + ':00';
    return range;
  }

  String convertDifferenceTime(DateTime starttime, DateTime endtime) {
    //bool init = await TrueTime.init();

    endtime.difference(starttime);
    return toYearsMonthsDaysString(endtime.difference(starttime).inDays);
  }

  String toYearsMonthsDaysString(int inDays) {
    int years = inDays ~/ 365;
    // You will need a custom logic for the months part, since not every month has 30 days
    int months = (inDays % 365) ~/ 30;
    int days = (inDays % 365) % 30;

    if (years < 1 && months < 1) {
      return "$days gün";
    } else if (years < 1) {
      return "$months ay $days gün";
    } else {
      return "$years yıl $months ay $days gün";
    }
  }

  String getAgeToString(DateTime dateTime) {
    int data = dateTime.year;
    int age = DateTime.now().year - data;
    return age.toString();
  }

  getShootingDays({DateTime start, DateTime end}) {
    String range = '';
    if (start == null) {
      range += '? - ';
    } else {
      range += convertDate(start.millisecondsSinceEpoch);
    }

    if (end == null) {
      range += '?';
    } else {
      range += convertDate(end.millisecondsSinceEpoch);
    }
    return range;
  }
}
