
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 42 (21.0 per locale)
 *
 * Built on 2022-10-28 at 06:10 UTC
 */

import 'package:flutter/widgets.dart';

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	pl, // 'pl'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

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
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		// force rebuild if TranslationProvider is used
		_translationProviderKey.currentState?.setLocale(_currLocale);

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsPl _translationsPl = _StringsPl.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.pl: return _translationsPl;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.pl: return _StringsPl.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return 'en';
			case AppLocale.pl: return 'pl';
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: 'en');
			case AppLocale.pl: return const Locale.fromSubtags(languageCode: 'pl');
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case 'en': return AppLocale.en;
			case 'pl': return AppLocale.pl;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r'^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$');
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll('_', '-'), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get tutorial_page_title_1 => 'This text is in english 1';
	String get tutorial_page_message_1 => 'This text is in english 1';
	String get tutorial_page_title_2 => 'This text is in english 2';
	String get tutorial_page_message_2 => 'This text is in english 2';
	String get done => 'Done';
	String get read_more => ' Read more';
	String get collapse => ' Collapse';
	String get filter_all => 'All';
	String get filter_favourites => 'Favourites';
	String get no_filter_results => 'We don\'t have any results for the selected filter.\n\nTry another one or play with the kitty 😻';
	String get mental_health => '#mental_health';
	String get fulfillment => '#fulfillment';
	String get awareness => '#awareness';
	String get joy => '#joy';
	String get habit => '#habit';
	String get goal => '#goal';
	String get improvement => '#improvement';
	String get discovering => '#discovering';
	String get relationship => '#relationship';
	String get health => '#health';
	String get physical_health => '#physical_health';
}

// Path: <root>
class _StringsPl implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsPl.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override late final Map<String, dynamic> _flatMap = _buildFlatMap();

	@override late final _StringsPl _root = this; // ignore: unused_field

	// Translations
	@override String get tutorial_page_title_1 => 'This text is in english 1';
	@override String get tutorial_page_message_1 => 'This text is in english 1';
	@override String get tutorial_page_title_2 => 'This text is in english 2';
	@override String get tutorial_page_message_2 => 'This text is in english 2';
	@override String get done => 'Done';
	@override String get read_more => ' Read more';
	@override String get collapse => ' Collapse';
	@override String get filter_all => 'All';
	@override String get filter_favourites => 'Favourites';
	@override String get no_filter_results => 'We don\'t have any results for the selected filter.\n\nTry another one or play with the kitty 😻';
	@override String get mental_health => '#mental_health';
	@override String get fulfillment => '#fulfillment';
	@override String get awareness => '#awareness';
	@override String get joy => '#joy';
	@override String get habit => '#habit';
	@override String get goal => '#goal';
	@override String get improvement => '#improvement';
	@override String get discovering => '#discovering';
	@override String get relationship => '#relationship';
	@override String get health => '#health';
	@override String get physical_health => '#physical_health';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'tutorial_page_title_1': 'This text is in english 1',
			'tutorial_page_message_1': 'This text is in english 1',
			'tutorial_page_title_2': 'This text is in english 2',
			'tutorial_page_message_2': 'This text is in english 2',
			'done': 'Done',
			'read_more': ' Read more',
			'collapse': ' Collapse',
			'filter_all': 'All',
			'filter_favourites': 'Favourites',
			'no_filter_results': 'We don\'t have any results for the selected filter.\n\nTry another one or play with the kitty 😻',
			'mental_health': '#mental_health',
			'fulfillment': '#fulfillment',
			'awareness': '#awareness',
			'joy': '#joy',
			'habit': '#habit',
			'goal': '#goal',
			'improvement': '#improvement',
			'discovering': '#discovering',
			'relationship': '#relationship',
			'health': '#health',
			'physical_health': '#physical_health',
		};
	}
}

extension on _StringsPl {
	Map<String, dynamic> _buildFlatMap() {
		return <String, dynamic>{
			'tutorial_page_title_1': 'This text is in english 1',
			'tutorial_page_message_1': 'This text is in english 1',
			'tutorial_page_title_2': 'This text is in english 2',
			'tutorial_page_message_2': 'This text is in english 2',
			'done': 'Done',
			'read_more': ' Read more',
			'collapse': ' Collapse',
			'filter_all': 'All',
			'filter_favourites': 'Favourites',
			'no_filter_results': 'We don\'t have any results for the selected filter.\n\nTry another one or play with the kitty 😻',
			'mental_health': '#mental_health',
			'fulfillment': '#fulfillment',
			'awareness': '#awareness',
			'joy': '#joy',
			'habit': '#habit',
			'goal': '#goal',
			'improvement': '#improvement',
			'discovering': '#discovering',
			'relationship': '#relationship',
			'health': '#health',
			'physical_health': '#physical_health',
		};
	}
}
