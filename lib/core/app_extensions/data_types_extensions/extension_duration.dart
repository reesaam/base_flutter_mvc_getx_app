import '../../../data/models/helper_models/date_time_difference_custom_model/date_time_difference_custom_model.dart';

extension Calculate on Duration {
  DateTimeDifferenceCustomModel calculateDifferenceInCustomDateTimeModel(Duration duration) {
    var dDay = duration.inDays;
    var dHour = duration.inHours;
    var dMinute = duration.inMinutes;
    var dSecond = duration.inSeconds;

    var year = dDay > 365 ? (dDay / 365).floor() : 0;
    var month = ((dDay - (year * 365)) / 30).floor();
    var week = ((dDay - (year * 365) - (month * 30)) / 7).floor();
    var day = (dDay - (year * 365) - (month * 30) - (week * 7)).floor();
    var hour = dHour - (dDay * 24);
    var minute = dMinute - (dHour * 60);
    var second = dSecond - (dMinute * 60);

    return DateTimeDifferenceCustomModel(year: year, month: month, week: week, day: day, hour: hour, minute: minute, second: second);
  }
}

extension NullFormat on Duration? {
  String get toCompleteFormat => this == null ? 'Not Specified' : this!.toCompleteFormat;
  String get toConditionalFormat => this == null ? 'Not Specified' : this!.toConditionalFormat;
}

extension Format on Duration {
  String get toCompleteFormat {
    DateTimeDifferenceCustomModel diff = calculateDifferenceInCustomDateTimeModel(this);
    return '${diff.year}Y, ${diff.month}M, ${diff.week}W, ${diff.day}D, ${diff.hour}H, ${diff.minute}M, ${diff.second}S';
  }

  String get toConditionalFormat {
    DateTimeDifferenceCustomModel diff = calculateDifferenceInCustomDateTimeModel(this);
    List<String> list = List<String>.empty(growable: true);
    var year = diff.year == 0 || diff.year == null ? null : list.add('${diff.year}Y,');
    var month = diff.month == 0 || diff.month == null ? null : list.add(' ${diff.month}M,');
    var week = diff.week == 0 || diff.week == null ? null : list.add(' ${diff.week}W,');
    var day = diff.day == 0 || diff.day == null ? null : list.add(' ${diff.day}D,');
    var hour = diff.hour == 0 || diff.hour == null ? null : list.add(' ${diff.hour}H,');
    var minute = diff.minute == 0 || diff.minute == null ? null : list.add(' ${diff.minute}M,');
    var second = diff.second == 0 || diff.second == null ? null : list.add(' ${diff.second}S,');
    String result = '';
    for (var s in list) {
      if (s.isNotEmpty) result = result + s;
    }
    result.isNotEmpty ? result = result.replaceRange(result.length - 1, result.length, '') : null;
    return result.isEmpty ? 'NONE' : result;
  }
}
