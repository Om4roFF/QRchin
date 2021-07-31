import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/presentation/utilities/header_widget.dart';
import 'package:qrching/providers/application_provider.dart';

class WinnersPage extends StatelessWidget {
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
          title: Text('Победители'),
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
                HeaderWidget(
                  content:
                      'Здесь представлены последние 100 победителей публичных розыгрышей.',
                ),
                _TableView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      child: Table(
        columnWidths: {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
          2: FlexColumnWidth(2),
          3: FlexColumnWidth(2),
        },
        children: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  '№',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'Выигрыш',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'Дата',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText(
                  'Победитель',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
          _buildTableRow(context,
              date: '11. 11. 2021',
              prize: '175\$',
              winner: 'Роман Романов',
              number: '1'),
          _buildDivider(),
          _buildTableRow(context,
              date: '11. 11. 2021',
              prize: '175\$',
              winner: 'Роман Романов',
              number: '1'),
          _buildDivider(),
          _buildTableRow(context,
              date: '11. 11. 2021',
              prize: '175\$',
              winner: 'Роман Романов',
              number: '1'),
          _buildDivider(),
          _buildTableRow(context,
              date: '11. 11. 2021',
              prize: '175\$',
              winner: 'Роман Романов',
              number: '1'),
        ],
      ),
    );
  }

  TableRow _buildDivider() {
    return TableRow(children: [
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 15,
      ),
      SizedBox(
        height: 15,
      ),
    ]);
  }

  TableRow _buildTableRow(BuildContext context,
      {required String date,
      required String winner,
      required String prize,
      required String number}) {
    return TableRow(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 2,
          ),
        ],
      ),
      children: [
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                prize,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                date,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                winner,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
