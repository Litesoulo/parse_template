/// Generated file. Do not edit.
///
/// Original: assets/translations
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 16 (8 per locale)
///
/// Built on 2024-06-29 at 05:58 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ru;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ru) // set locale
/// - Locale locale = AppLocale.ru.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ru) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	ru(languageCode: 'ru', build: Translations.build),
	tk(languageCode: 'tk', build: _StringsTk.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of translations).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = translations.someKey.anotherKey;
/// String b = translations['someKey.anotherKey']; // Only for edge cases!
Translations get translations => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final translations = Translations.of(context); // Get translations variable.
/// String a = translations.someKey.anotherKey; // Use translations variable.
/// String b = translations['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.translations.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get translations => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final translations = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsLoginScreenRu loginScreen = _StringsLoginScreenRu._(_root);
}

// Path: loginScreen
class _StringsLoginScreenRu {
	_StringsLoginScreenRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get login => 'Почта';
	String get password => 'Пароль';
	String get emailIsNotValid => 'Неверный формат email';
	String get passwordIsNotValid => 'Пароль не соответствует требованиям';
	String get signIn => 'Войти';
	String get continueWithoutAccount => 'Продолжить без аккаунта';
	String get failedLogin => 'Не удалось войти';
	String get networkError => 'Ошибка соединения с интернетом';
}

// Path: <root>
class _StringsTk extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTk.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.tk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tk>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _StringsTk _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsLoginScreenTk loginScreen = _StringsLoginScreenTk._(_root);
}

// Path: loginScreen
class _StringsLoginScreenTk extends _StringsLoginScreenRu {
	_StringsLoginScreenTk._(_StringsTk root) : this._root = root, super._(root);

	@override final _StringsTk _root; // ignore: unused_field

	// Translations
	@override String get login => 'Poçta';
	@override String get password => 'Açar sözi';
	@override String get emailIsNotValid => 'Poçtapyzyň formaty nädogry';
	@override String get passwordIsNotValid => 'Açar sözi talaba laýyk däl';
	@override String get signIn => 'Giriş';
	@override String get continueWithoutAccount => 'Hasapsyz dowam et';
	@override String get failedLogin => 'Ýalňyşlyk ýüze çykdy';
	@override String get networkError => 'Internet bilen bagly näsazlyk ýüze çykdy';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'loginScreen.login': return 'Почта';
			case 'loginScreen.password': return 'Пароль';
			case 'loginScreen.emailIsNotValid': return 'Неверный формат email';
			case 'loginScreen.passwordIsNotValid': return 'Пароль не соответствует требованиям';
			case 'loginScreen.signIn': return 'Войти';
			case 'loginScreen.continueWithoutAccount': return 'Продолжить без аккаунта';
			case 'loginScreen.failedLogin': return 'Не удалось войти';
			case 'loginScreen.networkError': return 'Ошибка соединения с интернетом';
			default: return null;
		}
	}
}

extension on _StringsTk {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'loginScreen.login': return 'Poçta';
			case 'loginScreen.password': return 'Açar sözi';
			case 'loginScreen.emailIsNotValid': return 'Poçtapyzyň formaty nädogry';
			case 'loginScreen.passwordIsNotValid': return 'Açar sözi talaba laýyk däl';
			case 'loginScreen.signIn': return 'Giriş';
			case 'loginScreen.continueWithoutAccount': return 'Hasapsyz dowam et';
			case 'loginScreen.failedLogin': return 'Ýalňyşlyk ýüze çykdy';
			case 'loginScreen.networkError': return 'Internet bilen bagly näsazlyk ýüze çykdy';
			default: return null;
		}
	}
}
