import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/providers/application_provider.dart';

class QuestionPage extends StatelessWidget {
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
          title: Text('Часто задаваемые вопросы'),
          leading: BackButton(
            onPressed: () {
              Provider.of<ApplicationProvider>(context, listen: false)
                  .setNavigationMenuIndex(4);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      'Общие вопросы',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                _ExpandCard(
                  title: 'Что такое платформа QRching?',
                  body: loremIpsum,
                ),
                _ExpandCard(
                  title: 'Что такое QR-код?',
                  body: loremIpsum,
                ),
                _ExpandCard(
                  title: 'Что такое блокчейн?',
                  body: loremIpsum,
                ),
                _ExpandCard(
                  title: 'Что такое хеш-функция?',
                  body: loremIpsum,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      'Для участников',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
                _ExpandCard(
                  title:
                      'Что необходимо сделать, чтобы принять участие в розыгрыше?',
                  body: loremIpsum,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const loremIpsum =
    "QR переводится с английского как \"Quick Response\", то есть \"быстрый отклик\". QR-код это духмерный штрихкод с информацией, которая может быть распознана с помощью камеры смартфона.";

class _ExpandCard extends StatelessWidget {
  final String title;
  final String body;

  const _ExpandCard({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: Colors.grey.withOpacity(0.1),
            width: 0.5,
          ),
        ),
        margin: EdgeInsets.only(left: 13, right: 13, top: 10),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    expandIcon: Icons.add_circle_outline,
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
                        loremIpsum,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
