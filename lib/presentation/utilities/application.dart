import 'package:hive_flutter/hive_flutter.dart';
import 'package:qrching/domain/model/history.dart';

class Application {
  // static final Future<SharedPreferences>? _prefs =
  //     SharedPreferences.getInstance();

  static const String clientHash = 'hash';
  static const String appTheme = 'theme';
  static const String language = 'lang';
  static const String historyBox = 'historyBox';
  static const String applicationBox = 'applicationBox';

  static Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HistoryAdapter());
    await Hive.openBox<History>(historyBox);
    await Hive.openBox(applicationBox);
  }

  static String getLanguage() {
    var box = Hive.box(applicationBox);
    return box.get(language, defaultValue: 'en');
    // final prefs = await _prefs;
    // final lang = prefs!.getString(language) ?? 'en';
    // return lang;
  }

  static setLanguage(String lang) {
    var box = Hive.box(applicationBox);
    box.put(language, lang);
    // final prefs = await _prefs;
    // prefs!.setString(language, lang);
  }

  static bool isClient() {
    var box = Hive.box(applicationBox);
    return box.containsKey(clientHash);
    // final prefs = await _prefs;
    // return prefs!.containsKey(clientHash);
  }

  static String? getClientHash() {
    var box = Hive.box(applicationBox);
    return box.get(clientHash);

    // final prefs = await _prefs;
    // return prefs!.getString(clientHash);
  }

  static setClientHash(String id) {
    var box = Hive.box(applicationBox);
    return box.put(clientHash, id);

    // final prefs = await _prefs;
    // prefs!.setString(clientHash, id);
  }

  static setDarkTheme(bool value) {
    var box = Hive.box(applicationBox);
    return box.put(appTheme, value);

    // final prefs = await _prefs;
    // prefs!.setBool(appTheme, value);
  }

  static bool isDarkTheme() {
    var box = Hive.box(applicationBox);
    return box.containsKey(appTheme);

    // final prefs = await _prefs;
    // return prefs!.getBool(appTheme) ?? false;
  }
}
