import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qrching/generated/l10n.dart';
import 'package:qrching/presentation/ui/splash_page.dart';
import 'package:qrching/presentation/utilities/app_theme.dart';
import 'package:qrching/presentation/utilities/application.dart';
import 'package:qrching/providers/application_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Application.initializeHive();
  final bool isDark = Application.isDarkTheme();
  final String lang = Application.getLanguage();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationProvider(isDark, lang),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:
          Provider.of<ApplicationProvider>(context, listen: true).getDarkMode()
              ? ThemeMode.dark
              : ThemeMode.light,
      home: Splash(),
    );
  }
}
