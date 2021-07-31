import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/generated/l10n.dart';
import 'package:qrching/providers/application_provider.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          children: [
            Flexible(
              child: AutoSizeText(
                S.of(context).scan_and_win,
                minFontSize: 26,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontSize: 26),
                maxLines: 1,
              ),
            ),
            Flexible(
              child: AutoSizeText(
                S.of(context).free,
                minFontSize: 26,
                style: TextStyle(
                  fontSize: 26,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 20),
                child: Image.asset(
                  'assets/images/main-2.png',
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: AutoSizeText(
                S
                    .of(context)
                    .intro_page_1_content,
                minFontSize: 12,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 26, left: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    S
                        .of(context)
                        .choose_lang,
                    style: TextStyle(
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),
                    maxLines: 1,
                    minFontSize: 14,
                  ),
                ),
              ),
            ),
            Flexible(flex: 1, child: _DropDownLanguageButton()),
          ],
        ),
      ),
    );
  }
}

class _DropDownLanguageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
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
                onTap: () {
                  S.load(Locale('de'));
                },
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
                value: 'de',
              ),
            ]),
      ),
    );
  }
}
