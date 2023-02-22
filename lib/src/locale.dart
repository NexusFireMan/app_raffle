import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Supported Languages
const kSupportedLanguages = [
  Locale('en', ''),
  Locale('es', ''),
];

class AppLocalizations {
  final Locale _locale;
  Map<String, dynamic> _messages = {};

  AppLocalizations(this._locale);

  static AppLocalizations? of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  static LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  // Charge language code
  Future<void> loadMessage() async {
    String jsonMessage = "";
    try {
      jsonMessage = await rootBundle
          .loadString('assets/i18n/${_locale.languageCode}.json');
    } catch (_) {
      jsonMessage = await rootBundle.loadString('assets/i18n/en.json');
    }

    _messages = json.decode(jsonMessage);
  }

  // Translate strings
  String translate(String key) {
    if (_messages.containsKey(key)) {
      return _messages[key];
    } else {
      var valLotated = key;
      assert(() {
        valLotated = 'Missing translation of $key';
        return true;
      }());

      return valLotated;
    }
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    try {
      kSupportedLanguages
          .firstWhere((element) => element.languageCode == locale.languageCode);
      return true;
    } catch (_) {}

    return false;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale);

    await appLocalizations.loadMessage();

    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
