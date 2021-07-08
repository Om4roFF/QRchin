import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/generated/l10n.dart';
import 'package:qrching/providers/application_provider.dart';
import 'package:qrching/ui/splash_page.dart';
import 'package:qrching/utilities/app_theme.dart';
import 'package:qrching/utilities/application.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool isDark = await Application.isDarkTheme();
  final String lang = await Application.getLanguage();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ApplicationProvider(isDark, lang),
      ),
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: Provider.of<ApplicationProvider>(context).getDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
      home: Splash(),
    );
  }
}
