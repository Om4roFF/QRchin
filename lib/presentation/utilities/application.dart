import 'package:shared_preferences/shared_preferences.dart';

class Application{

  static final Future<SharedPreferences>? _prefs =
      SharedPreferences.getInstance();

  static final String clientHash = 'hash';
  static final String appTheme = 'theme';
  static final String language = 'lang';

  static Future<String> getLanguage() async {
    final prefs = await _prefs;
    final lang = prefs!.getString(language) ?? 'en';
    return lang;
  }

  static setLanguage(String lang) async {
    final prefs = await _prefs;
    prefs!.setString(language, lang);
  }


  static Future<bool> isClient() async{
    final prefs = await _prefs;
    return prefs!.containsKey(clientHash);
  }

  static Future<String?> getClientHash() async {
    final prefs = await _prefs;
    return prefs!.getString(clientHash);
  }

  static setClientHash(String id) async {
    final prefs = await _prefs;
    prefs!.setString(clientHash, id);
  }

  static setDarkTheme(bool value) async{
    final prefs = await _prefs;
    prefs!.setBool(appTheme, value);
  }

  static Future<bool> isDarkTheme() async {
    final prefs = await _prefs;
    return prefs!.getBool(appTheme) ?? false;
  }

}