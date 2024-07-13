import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class _TkCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _TkCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'en';

  @override
  Future<CupertinoLocalizations> load(Locale locale) => TkCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(_TkCupertinoLocalizationsDelegate old) => false;

  @override
  String toString() => 'DefaultCupertinoLocalizations.delegate(en_US)';
}

/// US English strings for the Cupertino widgets.
class TkCupertinoLocalizations implements CupertinoLocalizations {
  /// Constructs an object that defines the cupertino widgets' localized strings
  /// for US English (only).
  ///
  /// [LocalizationsDelegate] implementations typically call the static [load]
  /// function, rather than constructing this class directly.
  const TkCupertinoLocalizations();

  /// Short version of days of week.
  static const List<String> shortWeekdays = <String>[
    'duş.',
    'siş.',
    'çar.',
    'pen.',
    'ann.',
    'şen.',
    'ýek.',
  ];

  static const List<String> _shortMonths = <String>[
    'ýan.',
    'few.',
    'mar.',
    'apr.',
    'maý',
    'iýn.',
    'iýl.',
    'awg.',
    'sen.',
    'okt.',
    'noý.',
    'dek.',
  ];

  static const List<String> _months = <String>[
    'ýanwar',
    'fewral',
    'mart',
    'aprel',
    'maý',
    'iýun',
    'iýul',
    'awgust',
    'sentýabr',
    'oktýabr',
    'noýabr',
    'dekabr',
  ];

  @override
  String datePickerYear(int yearIndex) => yearIndex.toString();

  @override
  String datePickerMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerStandaloneMonth(int monthIndex) => _months[monthIndex - 1];

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) {
    if (weekDay != null) {
      return ' ${shortWeekdays[weekDay - DateTime.monday]} $dayIndex ';
    }

    return dayIndex.toString();
  }

  @override
  String datePickerHour(int hour) => hour.toString();

  @override
  String datePickerHourSemanticsLabel(int hour) => "$hour sagat";

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    if (minute == 1) {
      return '1 minut';
    }
    return '$minute minut';
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return '${shortWeekdays[date.weekday - DateTime.monday]} '
        '${_shortMonths[date.month - DateTime.january]} '
        '${date.day.toString().padRight(2)}';
  }

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.mdy;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder => DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String get anteMeridiemAbbreviation => 'AM';

  @override
  String get postMeridiemAbbreviation => 'PM';

  @override
  String get todayLabel => 'Bu gün';

  @override
  String get alertDialogLabel => 'Duýduryş';

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    assert(tabIndex >= 1);
    assert(tabCount >= 1);
    return '$tabIndex / $tabCount';
  }

  @override
  String timerPickerHour(int hour) => hour.toString();

  @override
  String timerPickerMinute(int minute) => minute.toString();

  @override
  String timerPickerSecond(int second) => second.toString();

  @override
  String timerPickerHourLabel(int hour) => 'sagat';

  @override
  List<String> get timerPickerHourLabels => const <String>['sagat'];

  @override
  String timerPickerMinuteLabel(int minute) => 'min.';

  @override
  List<String> get timerPickerMinuteLabels => const <String>['min.'];

  @override
  String timerPickerSecondLabel(int second) => 'sek.';

  @override
  List<String> get timerPickerSecondLabels => const <String>['sek.'];

  @override
  String get cutButtonLabel => 'Kes';

  @override
  String get copyButtonLabel => 'Göçür';

  @override
  String get pasteButtonLabel => 'Goý';

  @override
  String get clearButtonLabel => 'Arassala';

  @override
  String get noSpellCheckReplacementsLabel => 'Çalyşma tapylmady';

  @override
  String get selectAllButtonLabel => 'Ählisini saýl';

  @override
  String get lookUpButtonLabel => 'Gözle';

  @override
  String get searchWebButtonLabel => 'Internetdan gözle';

  @override
  String get shareButtonLabel => 'Paýlaş...';

  @override
  String get searchTextFieldPlaceholderLabel => 'Gözle';

  @override
  String get modalBarrierDismissLabel => 'Aýyr';

  @override
  String get menuDismissLabel => 'Menýuny aýyr';

  /// Creates an object that provides US English resource values for the
  /// cupertino library widgets.
  ///
  /// The [locale] parameter is ignored.
  ///
  /// This method is typically used to create a [LocalizationsDelegate].
  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(const TkCupertinoLocalizations());
  }

  /// A [LocalizationsDelegate] that uses [TkCupertinoLocalizations.load]
  /// to create an instance of this class.
  static const LocalizationsDelegate<CupertinoLocalizations> delegate = _TkCupertinoLocalizationsDelegate();
}
