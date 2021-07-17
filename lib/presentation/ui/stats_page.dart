import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/presentation/utilities/custom_icons_icons.dart';
import 'package:qrching/providers/application_provider.dart';

class StatisticPage extends StatelessWidget {
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
          title: Text('Статистика'),
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
                _StatCard(
                  title: 'Количество сканирований',
                  icon: Icon(CustomIcons.scan),
                  number: '12',
                ),
                _StatCard(
                  title: 'Количество побед',
                  icon: Icon(CustomIcons.wins),
                  number: '5',
                ),
                _StatCard(
                  title: 'Количество розыгрышей',
                  icon: Icon(CustomIcons.main),
                  number: '7',
                ),
                _StatCard(
                  title: 'Количество созданных розыгрышей',
                  icon: Icon(CustomIcons.edit),
                  number: '13',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final Icon icon;
  final String number;

  const _StatCard(
      {Key? key, required this.title, required this.icon, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.grey.withOpacity(0.1),
          width: 0.5,
        ),
      ),
      margin: EdgeInsets.only(left: 13, right: 13, top: 10),
      child: Container(
        width: double.infinity,
        height: 105,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: icon,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      number,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
