import 'dart:developer';
import 'dart:io';

import 'package:blake2b/blake2b_hash.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:qrching/generated/l10n.dart';
import 'package:qrching/internal/dependencies/user_state_module.dart';
import 'package:qrching/presentation/ui/home_page/home_page.dart';
import 'package:qrching/presentation/ui/introduction_page/second_intoduction_page.dart';
import 'package:qrching/presentation/utilities/application.dart';
import 'package:qrching/presentation/utilities/custom_icons_icons.dart';
import 'package:qrching/providers/application_provider.dart';

import 'first_introduction_page.dart';
import 'third_introduction_page.dart';

class IntroductionPage extends StatelessWidget {
  final introKey = GlobalKey<IntroductionScreenState>();
  final languages = const [
    'English',
    'Руский',
    'German',
  ];

  IntroductionPage({Key? key}) : super(key: key);

  void _onIntroEnd(context) async {
    final provider = Provider.of<ApplicationProvider>(context, listen: false);
    Locale myLocale = Localizations.localeOf(context);
    final String imei = await getImei();
    final hash = Blake2bHash.hashUtf8String2HexString(imei).toUpperCase();
    log('LANGUAGE CODE: ${myLocale.languageCode}');
    log('CURRENT LANGUAGE ${provider.getLang}');
    log('HASH: $hash');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (BuildContext context) => UserStateModule.userCubit(
              hash: hash,
              lang: provider.getLang,
              country: myLocale.languageCode)
            ..initializeClientData(),
          child: HomePage(),
        ),
      ),
    );
  }

  Future<String> getImei() async {
    late final String imei;
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      imei = androidInfo.androidId;
    } else if (Platform.isIOS) {
      final iphoneInfo = await deviceInfoPlugin.iosInfo;
      imei = iphoneInfo.identifierForVendor;
    }
    return imei;
  }

  void _switchTheme(BuildContext context) async {
    final currentTheme = valueTheme(context);
    Provider.of<ApplicationProvider>(context, listen: false)
        .setThemeMode(!currentTheme);
    Application.setDarkTheme(!currentTheme);
  }

  bool valueTheme(context) {
    return Provider.of<ApplicationProvider>(context, listen: false)
        .getDarkMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalHeader: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => _switchTheme(context),
                    icon: valueTheme(context)
                        ? Icon(
                            Icons.light_mode,
                          )
                        : Icon(
                            Icons.dark_mode,
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CustomIcons.main,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'QRching',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        rawPages: [
          FirstPage(),
          SecondPage(),
          ThirdPage(),
        ],
        animationDuration: 1000,
        onDone: () => _onIntroEnd(context),
        // skipFlex: 2,
        // nextFlex: 6,

        // dotsFlex: 6,
        next: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              S.of(context).further,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        done: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              S.of(context).done,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin:
            const EdgeInsets.only(right: 0, left: 0, bottom: 0, top: 0),
        isTopSafeArea: true,
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(15.0)
            : const EdgeInsets.only(right: 10, left: 0, top: 0, bottom: 0),
        dotsDecorator: DotsDecorator(
          size: Size(10.0, 10.0),
          color: Colors.grey[300]!,
          activeColor: Color.fromRGBO(90, 176, 162, 1),
          activeSize: Size(11, 11),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
