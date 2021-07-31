import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/presentation/utilities/application.dart';
import 'package:qrching/providers/application_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Provider.of<ApplicationProvider>(context, listen: false)
            .setNavigationMenuIndex(4);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Настройки'),
          leading: BackButton(
            onPressed: () {
              Provider.of<ApplicationProvider>(context, listen: false)
                  .setNavigationMenuIndex(4);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                _ThemeSwitcher(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeSwitcher extends StatefulWidget {
  @override
  __ThemeSwitcherState createState() => __ThemeSwitcherState();
}

class __ThemeSwitcherState extends State<_ThemeSwitcher> {
  bool isLight = true;

  @override
  void initState() {
    super.initState();
    isLight = valueTheme(context);
  }

  void _switchTheme(value) async {
    print(value);
    setState(() {
      isLight = value;
    });
    Provider.of<ApplicationProvider>(context, listen: false)
        .setThemeMode(!value);
    Application.setDarkTheme(!value);
  }

  bool valueTheme(context) {
    return !Provider.of<ApplicationProvider>(context, listen: false)
        .getDarkMode();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.1),
          width: 0.5,
        ),
      ),
      elevation: 4,
      margin: EdgeInsets.only(left: 13, right: 13, top: 10),
      child: SwitchListTile(
        value: isLight,
        onChanged: _switchTheme,
        title: Text('Светлая тема'),
      ),
    );
  }
}
