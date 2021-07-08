
import 'package:flutter/material.dart';
import 'package:qrching/providers/application_provider.dart';
import 'package:qrching/ui/home_page/another_widget.dart';
import 'package:qrching/ui/home_page/create_widget.dart';
import 'package:qrching/ui/home_page/history_widget.dart';
import 'package:qrching/ui/home_page/review_widget.dart';
import 'package:qrching/ui/home_page/scanner_widget.dart';
import 'package:qrching/utilities/custom_icons_icons.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {

   final List<Widget> _children = [CreateWidget(), ReviewWidget(), ScannerWidget(), HistoryWidget(), AnotherWidget()];

  void _onTap(int index, BuildContext context) async{
    Provider.of<ApplicationProvider>(context, listen: false).setNavigationMenuIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),),
      body: _children[context.select((ApplicationProvider app) => app.getNavigationIndex)],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        onTap: (index) => _onTap(index, context),
        currentIndex: context.select((ApplicationProvider app) => app.getNavigationIndex),
        items: [
          BottomNavigationBarItem(icon: Icon(CustomIcons.subtract,), label: 'Создать'),
          BottomNavigationBarItem(icon: Icon(CustomIcons.vector,), label: 'Обзор'),
          BottomNavigationBarItem(icon: Icon(CustomIcons.group,), label: 'Сканер'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time_filled_sharp, ), label: 'История'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'Ещё'),
      ],),
    );
  }
}
