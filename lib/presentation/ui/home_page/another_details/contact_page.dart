import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:qrching/presentation/utilities/header_widget.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Контактная информация',
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
                content:
                    'Напиши нам через обратную связь или используй контактные данные ниже.'),
            _MainInfo(),
            _InfoListView(),
          ],
        ),
      ),
    );
  }
}

class _MainInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.all(6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'QRching UG (haftungsbeschränkt)',
            style: Theme.of(context).textTheme.headline6,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                AutoSizeText(
                  'Dr.-Hans-Jakob-Straße 5 83059 Kolbermoor\nГермания',
                  style: Theme.of(context).textTheme.bodyText2,
                  minFontSize: 14,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.phone_iphone_rounded,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                AutoSizeText(
                  '+ 49 157 352 80319 ',
                  minFontSize: 14,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                AutoSizeText(
                  'contact@qrching.com',
                  minFontSize: 14,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.watch_later_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'График работы (UTC Германия)',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      minFontSize: 12,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AutoSizeText(
                      'Понедельник – Пятница с 8:00 до 18:00\n\nСуббота – Воскресенье выходные',
                      minFontSize: 14,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoListView extends StatelessWidget {
  final ExpandableController _firstController = ExpandableController();
  final ExpandableController _secondController = ExpandableController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ExpandCard(
          title: 'Идентификационный номер налогоплательщика',
          body: 'Content',
          controller: _firstController,
        ),
        _ExpandCard(
          title: 'Урегулирование споров в ЕС',
          body: 'Content',
          controller: _secondController,
        ),
      ],
    );
  }
}

class _ExpandCard extends StatelessWidget {
  final String title;
  final String body;
  final ExpandableController controller;

  const _ExpandCard(
      {Key? key,
      required this.title,
      required this.body,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Theme.of(context).dividerColor,
      margin: EdgeInsets.only(left: 13, right: 13, top: 10),
      clipBehavior: Clip.hardEdge,
      child: ExpandableNotifier(
        child: ExpandablePanel(
          controller: controller,
          theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              expandIcon: Icons.add_circle_outline,
              useInkWell: false,
              collapseIcon: Icons.remove_circle,
              alignment: Alignment.center,
              iconColor: Color.fromRGBO(90, 176, 162, 1),
              iconPadding:
                  EdgeInsets.only(right: 18, left: 8, top: 8, bottom: 8)
              // iconPadding: EdgeInsets.all(16)
              ),
          header: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15, bottom: 15),
            child: Text(
              title,
              style: TextStyle(fontSize: 14),
            ),
          ),
          collapsed: SizedBox(),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(
                indent: 20,
                endIndent: 18,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Text(
                  'TEXT',
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
