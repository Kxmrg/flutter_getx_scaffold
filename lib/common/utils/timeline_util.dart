import 'package:getx_scaffold/common/utils/date_util.dart';

/// (xx)Configurable output.
/// (xx)为可配置输出.
enum DayFormat {
  /// (less than 10s->just now)、x minutes、x hours、(Yesterday)、x days.
  /// (小于10s->刚刚)、x分钟、x小时、(昨天)、x天.
  simple,

  /// (less than 10s->just now)、x minutes、x hours、[This year:(Yesterday/a day ago)、(two days age)、MM-dd ]、[past years: yyyy-MM-dd]
  /// (小于10s->刚刚)、x分钟、x小时、[今年: (昨天/1天前)、(2天前)、MM-dd],[往年: yyyy-MM-dd].
  common,

  /// 日期 + HH:mm
  /// (less than 10s->just now)、x minutes、x hours、[This year:(Yesterday HH:mm/a day ago)、(two days age)、MM-dd HH:mm]、[past years: yyyy-MM-dd HH:mm]
  /// 小于10s->刚刚)、x分钟、x小时、[今年: (昨天 HH:mm/1天前)、(2天前)、MM-dd HH:mm],[往年: yyyy-MM-dd HH:mm].
  full,
}

/**
 * @Author: Sky24n
 * @GitHub: https://github.com/Sky24n
 * @Description: Timeline Util.
 * @Date: 2018/10/3
 */
/// Timeline information configuration.
/// Timeline信息配置.
abstract class TimelineInfo {
  String suffixAgo(); //suffix ago(后缀 后).

  String suffixAfter(); //suffix after(后缀 前).

  int maxJustNowSecond() => 30; // max just now second.

  String lessThanOneMinute() => ''; //just now(刚刚).

  String customYesterday() => ''; //Yesterday(昨天).优先级高于keepOneDay

  bool keepOneDay(); //保持1天,example: true -> 1天前, false -> MM-dd.

  bool keepTwoDays(); //保持2天,example: true -> 2天前, false -> MM-dd.

  String oneMinute(int minutes); //a minute(1分钟).

  String minutes(int minutes); //x minutes(x分钟).

  String anHour(int hours); //an hour(1小时).

  String hours(int hours); //x hours(x小时).

  String oneDay(int days); //a day(1天).

  String weeks(int week) => ''; //x week(星期x).

  String days(int days); //x days(x天).
}

class ZhInfo implements TimelineInfo {
  @override
  String suffixAgo() => '前';

  @override
  String suffixAfter() => '后';

  @override
  int maxJustNowSecond() => 30;

  @override
  String lessThanOneMinute() => '刚刚';

  @override
  String customYesterday() => '昨天';

  @override
  bool keepOneDay() => true;

  @override
  bool keepTwoDays() => true;

  @override
  String oneMinute(int minutes) => '$minutes分钟';

  @override
  String minutes(int minutes) => '$minutes分钟';

  @override
  String anHour(int hours) => '$hours小时';

  @override
  String hours(int hours) => '$hours小时';

  @override
  String oneDay(int days) => '$days天';

  @override
  String weeks(int week) => ''; //x week(星期x).

  @override
  String days(int days) => '$days天';
}

class EnInfo implements TimelineInfo {
  @override
  String suffixAgo() => ' ago';

  @override
  String suffixAfter() => ' after';

  @override
  int maxJustNowSecond() => 30;

  @override
  String lessThanOneMinute() => 'just now';

  @override
  String customYesterday() => 'Yesterday';

  @override
  bool keepOneDay() => true;

  @override
  bool keepTwoDays() => true;

  @override
  String oneMinute(int minutes) => 'a minute';

  @override
  String minutes(int minutes) => '$minutes minutes';

  @override
  String anHour(int hours) => 'an hour';

  @override
  String hours(int hours) => '$hours hours';

  @override
  String oneDay(int days) => 'a day';

  @override
  String weeks(int week) => ''; //x week(星期x).

  @override
  String days(int days) => '$days days';
}

class ZhNormalInfo implements TimelineInfo {
  @override
  String suffixAgo() => '前';

  @override
  String suffixAfter() => '后';

  @override
  int maxJustNowSecond() => 30;

  @override
  String lessThanOneMinute() => '刚刚';

  @override
  String customYesterday() => '昨天';

  @override
  bool keepOneDay() => true;

  @override
  bool keepTwoDays() => false;

  @override
  String oneMinute(int minutes) => '$minutes分钟';

  @override
  String minutes(int minutes) => '$minutes分钟';

  @override
  String anHour(int hours) => '$hours小时';

  @override
  String hours(int hours) => '$hours小时';

  @override
  String oneDay(int days) => '$days天';

  @override
  String weeks(int week) => ''; //x week(星期x).

  @override
  String days(int days) => '$days天';
}

class EnNormalInfo implements TimelineInfo {
  @override
  String suffixAgo() => ' ago';

  @override
  String suffixAfter() => ' after';

  @override
  int maxJustNowSecond() => 30;

  @override
  String lessThanOneMinute() => 'just now';

  @override
  String customYesterday() => 'Yesterday';

  @override
  bool keepOneDay() => true;

  @override
  bool keepTwoDays() => false;

  @override
  String oneMinute(int minutes) => 'a minute';

  @override
  String minutes(int minutes) => '$minutes minutes';

  @override
  String anHour(int hours) => 'an hour';

  @override
  String hours(int hours) => '$hours hours';

  @override
  String oneDay(int days) => 'a day';

  @override
  String weeks(int week) => ''; //x week(星期x).

  @override
  String days(int days) => '$days days';
}

Map<String, TimelineInfo> _timelineInfoMap = {
  'zh': ZhInfo(),
  'en': EnInfo(),
  'zh_normal': ZhNormalInfo(), //keepTwoDays() => false
  'en_normal': EnNormalInfo(), //keepTwoDays() => false
};

/// add custom configuration.
void setLocaleInfo(String locale, TimelineInfo timelineInfo) {
  ArgumentError.checkNotNull(locale, '[locale] must not be null');
  ArgumentError.checkNotNull(timelineInfo, '[timelineInfo] must not be null');
  _timelineInfoMap[locale] = timelineInfo;
}

/// TimelineUtil
class TimelineUtil {
  /// format time by DateTime.
  /// dateTime
  /// locDateTime: current time or schedule time.
  /// locale: output key.
  static String formatByDateTime(
    DateTime dateTime, {
    DateTime? locDateTime,
    String? locale,
    DayFormat? dayFormat,
  }) {
    return format(
      dateTime.millisecondsSinceEpoch,
      locTimeMs: locDateTime?.millisecondsSinceEpoch,
      locale: locale,
      dayFormat: dayFormat,
    );
  }

  /// format time by millis.
  /// dateTime : millis.
  /// locDateTime: current time or schedule time. millis.
  /// locale: output key.
  static String format(
    int ms, {
    int? locTimeMs,
    String? locale,
    DayFormat? dayFormat,
  }) {
    int locTimeMs0 = locTimeMs ?? DateTime.now().millisecondsSinceEpoch;
    String locale0 = locale ?? 'en';
    TimelineInfo info = _timelineInfoMap[locale0] ?? EnInfo();
    DayFormat dayFormat0 = dayFormat ?? DayFormat.common;

    int elapsed = locTimeMs0 - ms;
    String suffix;
    if (elapsed < 0) {
      suffix = info.suffixAfter();
      // suffix after is empty. user just now.
      if (suffix.isNotEmpty) {
        elapsed = elapsed.abs();
        dayFormat0 = DayFormat.simple;
      } else {
        return info.lessThanOneMinute();
      }
    } else {
      suffix = info.suffixAgo();
    }

    String timeline;
    if (info.customYesterday().isNotEmpty &&
        DateUtil.isYesterdayByMs(ms, locTimeMs0)) {
      return _getYesterday(ms, info, dayFormat0);
    }

    if (!DateUtil.yearIsEqualByMs(ms, locTimeMs0)) {
      timeline = _getYear(ms, dayFormat0);
      if (timeline.isNotEmpty) return timeline;
    }

    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;

    if (seconds < 90) {
      timeline = info.oneMinute(1);
      if (suffix != info.suffixAfter() &&
          info.lessThanOneMinute().isNotEmpty &&
          seconds < info.maxJustNowSecond()) {
        timeline = info.lessThanOneMinute();
        suffix = '';
      }
    } else if (minutes < 60) {
      timeline = info.minutes(minutes.round());
    } else if (minutes < 90) {
      timeline = info.anHour(1);
    } else if (hours < 24) {
      timeline = info.hours(hours.round());
    } else {
      if ((days.round() == 1 && info.keepOneDay() == true) ||
          (days.round() == 2 && info.keepTwoDays() == true)) {
        dayFormat0 = DayFormat.simple;
      }
      timeline = _formatDays(ms, days.round(), info, dayFormat0);
      suffix = (dayFormat0 == DayFormat.simple ? suffix : '');
    }
    return timeline + suffix;
  }

  /// Timeline like QQ.
  ///
  /// today (HH:mm)
  /// yesterday (昨天;Yesterday)
  /// this week (星期一,周一;Monday,Mon)
  /// others (yyyy-MM-dd)
  static String formatA(
    int ms, {
    int? locMs,
    String formatToday = 'HH:mm',
    String format = 'yyyy-MM-dd',
    String languageCode = 'en',
    bool short = false,
  }) {
    int locTimeMs = locMs ?? DateTime.now().millisecondsSinceEpoch;
    int elapsed = locTimeMs - ms;
    if (elapsed < 0) {
      return DateUtil.formatDateMs(ms, format: formatToday);
    }

    if (DateUtil.isToday(ms, locMs: locTimeMs)) {
      return DateUtil.formatDateMs(ms, format: formatToday);
    }

    if (DateUtil.isYesterdayByMs(ms, locTimeMs)) {
      return languageCode == 'zh' ? '昨天' : 'Yesterday';
    }

    if (DateUtil.isWeek(ms, locMs: locTimeMs)) {
      return DateUtil.getWeekdayByMs(ms,
          languageCode: languageCode, short: short);
    }

    return DateUtil.formatDateMs(ms, format: format);
  }

  /// get Yesterday.
  /// 获取昨天.
  static String _getYesterday(
    int ms,
    TimelineInfo info,
    DayFormat dayFormat,
  ) {
    return info.customYesterday() +
        (dayFormat == DayFormat.full
            ? (' ${DateUtil.formatDateMs(ms, format: 'HH:mm')}')
            : '');
  }

  /// get is not year info.
  /// 获取非今年信息.
  static String _getYear(
    int ms,
    DayFormat dayFormat,
  ) {
    if (dayFormat != DayFormat.simple) {
      return DateUtil.formatDateMs(ms,
          format: (dayFormat == DayFormat.common
              ? 'yyyy-MM-dd'
              : 'yyyy-MM-dd HH:mm'));
    }
    return '';
  }

  /// format Days.
  static String _formatDays(
    int ms,
    num days,
    TimelineInfo info,
    DayFormat dayFormat,
  ) {
    String timeline;
    switch (dayFormat) {
      case DayFormat.simple:
        timeline = (days == 1
            ? info.customYesterday().isEmpty
                ? info.oneDay(days.round())
                : info.days(2)
            : info.days(days.round()));
        break;
      case DayFormat.common:
        timeline = DateUtil.formatDateMs(ms, format: 'MM-dd');
        break;
      case DayFormat.full:
        timeline = DateUtil.formatDateMs(ms, format: 'MM-dd HH:mm');
        break;
    }
    return timeline;
  }
}
