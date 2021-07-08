import 'package:shared_preferences/shared_preferences.dart';

class Application{

  static final Future<SharedPreferences>? _prefs = SharedPreferences.getInstance();


  static final String clientId = 'id';
  static final String appTheme = 'theme';
  static final String language = 'lang';

  
  static Future<String> getLanguage() async{
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
    return prefs!.getBool(clientId) ?? false;
  }

  static Future<String?> getClientId() async{
    final prefs = await _prefs;
    return prefs!.getString(clientId);
  }

  static setClientId(String id) async{
    final prefs = await _prefs;
    prefs!.setString(clientId, id);
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