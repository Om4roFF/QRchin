import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:qrching/generated/l10n.dart';
import 'package:qrching/providers/application_provider.dart';
import 'package:qrching/ui/home_page/home_page.dart';
import 'package:qrching/utilities/application.dart';
import 'package:qrching/utilities/custom_icons_icons.dart';
import 'package:blake2b/blake2b_hash.dart';
import 'package:country_codes/country_codes.dart';

class IntroductionPage extends StatelessWidget {
  final String? locale;
  final introKey = GlobalKey<IntroductionScreenState>();
  final languages = const [
    'English',
    'Руский',
    'German',
  ];

  IntroductionPage({Key? key, this.locale}) : super(key: key);

  void _onIntroEnd(context) async {
    final provider = Provider.of<ApplicationProvider>(context, listen: false);
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Locale myLocale = Localizations.localeOf(context);
    print(myLocale.languageCode);
    print(myLocale.countryCode);

    late final imei;
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      imei = androidInfo.androidId;
    } else if (Platform.isIOS) {
      final iphoneInfo = await deviceInfoPlugin.iosInfo;
      imei = iphoneInfo.identifierForVendor;
    }
    final hash = Blake2bHash.hashUtf8String2HexString(imei).toUpperCase();
    print(hash);

    print(locale);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider<ApplicationProvider>.value(
          value: provider,
          child: HomePage(),
        ),
      ),
    );
  }

  void _switchTheme(BuildContext context) async {
    final currentTheme =
        Provider.of<ApplicationProvider>(context, listen: false).getDarkMode;
    Provider.of<ApplicationProvider>(context, listen: false)
        .setThemeMode(!currentTheme);
    Application.setDarkTheme(!currentTheme);
  }

  bool valueTheme(context) {
    return Provider.of<ApplicationProvider>(context).getDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        // key: introKey,
        globalHeader: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => _switchTheme(context),
                    icon:
                        Provider.of<ApplicationProvider>(context, listen: false)
                                .getDarkMode
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
                      CustomIcons.group,
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
          _FirstPage(),
          _SecondPage(),
          _ThirdPage(),
        ],
        animationDuration: 1000,
        onDone: () => _onIntroEnd(context),
        skipFlex: 2,
        nextFlex: 6,
        dotsFlex: 6,
        next: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              S.of(context).further,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward_outlined,
              color: Theme.of(context).textTheme.bodyText1!.color,
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
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.arrow_forward_outlined,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ],
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.only(right: 0, left: 0, bottom: 10),
        isTopSafeArea: true,
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(15.0)
            : const EdgeInsets.only(right: 0, left: 0),
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

class _FirstPage extends StatelessWidget {
  const _FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            Text(
              S.of(context).scan_and_win,
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: 26),
            ),
            Text(
              S.of(context).free,
              style: TextStyle(
                fontSize: 26,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 20),
              child: Image.asset(
                'assets/images/main-2.png',
              ),
            ),
            Text(
              S.of(context).intro_page_1_content,
              style: TextStyle(fontSize: 12),
            ),
            Padding(
              padding: EdgeInsets.only(top: 26, left: 40),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    S.of(context).choose_lang,
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.only(left: 37, right: 37),
              padding: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                    ),
                    value: context.watch<ApplicationProvider>().getLang,
                    onChanged: (newValue) {
                      Provider.of<ApplicationProvider>(context, listen: false)
                          .setLang(newValue!);
                    },
                    items: [
                      DropdownMenuItem<String>(
                        onTap: () {
                          S.load(Locale('ru'));
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'icons/flags/png/ru.png',
                                package: 'country_icons',
                                fit: BoxFit.cover,
                                height: 35,
                                width: 35,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text('Русский'),
                            ),
                          ],
                        ),
                        value: 'ru',
                      ),
                      DropdownMenuItem<String>(
                        onTap: () {
                          S.load(Locale('en'));
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'icons/flags/png/gb.png',
                                package: 'country_icons',
                                fit: BoxFit.cover,
                                height: 35,
                                width: 35,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text('English'),
                            ),
                          ],
                        ),
                        value: 'en',
                      ),
                      DropdownMenuItem<String>(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'icons/flags/png/de.png',
                                package: 'country_icons',
                                fit: BoxFit.cover,
                                height: 35,
                                width: 35,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: Text('German'),
                            ),
                          ],
                        ),
                        value: 'gr',
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  final content = const [
    ['Зайти в раздел ', 'Обзор розыгрышей', CustomIcons.vector],
    ['Перейти по одной из ссылок непосредственно к \nрозыгрышу', null, null],
    [
      'Найти QR-код и сохранить его в галерею или \nотобразить на экране компьютера',
      null,
      null
    ],
    ['Отсканировать QR-код с помощью ', 'Сканера', CustomIcons.group],
  ];

  const _SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                'Участвуй в бесплатных розыгрышах и выигрывай денежные призы по всему миру!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 20),
              child: Image.asset('assets/images/main-1.png'),
            ),
            Text(
              'Чтобы принять участие в розыгрыше тебе нужно:',
              style: TextStyle(fontSize: 14),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: content.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          child: Container(
                            color: Theme.of(context).dialogBackgroundColor,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(fontSize: 12),
                            ),
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${content[index][0]}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontSize: 12),
                                ),
                                content[index][1] != null
                                    ? TextSpan(
                                        text: '${content[index][1]}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 12),
                                      )
                                    : TextSpan(),
                                TextSpan(text: ' '),
                                WidgetSpan(
                                  child: Icon(
                                    content[index][2] != null
                                        ? content[index][2]! as IconData
                                        : null,
                                    size: 15,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class _ThirdPage extends StatelessWidget {
  const _ThirdPage({Key? key}) : super(key: key);

  final content = const [
    ['Зайти в раздел ', 'Создать розыгрыш', CustomIcons.subtract],
    ['Заполнить и отправить форму заявки', null, null],
    ['Оплатить розыгрыш', null, null],
    ['Получить QR-код и разместить его на своей странице', null, null],
    [
      'Розыгрыш автоматически появится в обзоре \nрозыгрышей в указанное тобой время',
      null,
      null
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 100),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Text(
                'Создавай розыгрыши для увеличения посещаемости своего сайта или канала!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 15, left: 40, right: 40, bottom: 20),
              child: Image.asset('assets/images/main-3.png'),
            ),
            Text(
              'Чтобы создать публичный розыгрыш тебе нужно:',
              style: TextStyle(fontSize: 14),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: content.length,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 25),
                    // EdgeInsets.all(8),
                    child: Row(
                      children: [
                        ClipRRect(
                          child: Container(
                            color: Theme.of(context).dialogBackgroundColor,
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(fontSize: 12),
                            ),
                            width: 20,
                            height: 20,
                            alignment: Alignment.center,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${content[index][0]}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontSize: 12),
                                ),
                                content[index][1] != null
                                    ? TextSpan(
                                        text: '${content[index][1]}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 12),
                                      )
                                    : TextSpan(),
                                TextSpan(text: ' '),
                                WidgetSpan(
                                  child: Icon(
                                    content[index][2] != null
                                        ? content[index][2]! as IconData
                                        : null,
                                    size: 15,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
