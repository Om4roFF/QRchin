import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/presentation/utilities/application.dart';
import 'package:qrching/providers/application_provider.dart';

class TestWidget extends StatelessWidget {
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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('TEST'),
      ),
      body: Container(
        child: Center(
          child: TextButton(
            onPressed: () {
              _switchTheme(context);
            },
            child: Text(
              "Switch theme",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
