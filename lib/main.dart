import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:qrching/generated/l10n.dart';
import 'package:qrching/providers/application_provider.dart';
import 'package:qrching/ui/home_page/home_page.dart';
import 'package:qrching/ui/introduction_page/introduction_page.dart';
import 'package:qrching/utilities/app_theme.dart';
import 'package:qrching/utilities/application.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final s = Intl.getCurrentLocale();
  print('*' * 30 + '$s');
  final isClient = await Application.isClient();
  final bool isDark = await Application.isDarkTheme();
  final String lang = await Application.getLanguage();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ApplicationProvider(isDark, lang),
      ),
    ],
    child: App(
      isClient: isClient,
    ),
  ));
}

class App extends StatelessWidget {
  final bool isClient;

  const App(
      {Key? key,
      required this.isClient,})
      : super(key: key);

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
      home: isClient ? HomePage() : IntroductionPage(),
    );
  }
}
