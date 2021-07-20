import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qrching/domain/cubit/user_cubit.dart';
import 'package:qrching/generated/l10n.dart';
import 'package:qrching/internal/dependencies/user_state_module.dart';
import 'package:qrching/presentation/ui/introduction_page/introduction_page.dart';
import 'package:qrching/presentation/ui/splash_page.dart';
import 'package:qrching/presentation/ui/test.dart';
import 'package:qrching/presentation/utilities/app_theme.dart';
import 'package:qrching/presentation/utilities/application.dart';
import 'package:qrching/providers/application_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool isDark = await Application.isDarkTheme();
  final String lang = await Application.getLanguage();
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
