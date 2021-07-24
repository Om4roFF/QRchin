import 'dart:developer';

import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/providers/application_provider.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late ExpandableController _firstController = ExpandableController();
  late ExpandableController _secondController;
  late ExpandableController _thirdController;
  late ExpandableController _fourthController;
  late ExpandableController _fifthController;

  @override
  void initState() {
    // _firstController = ExpandableController();
    _secondController = ExpandableController();
    _thirdController = ExpandableController();
    _fourthController = ExpandableController();
    _fifthController = ExpandableController();
    super.initState();
  }

  _toggleExpandables(int index) {
    log('TOGGLEE');
    _firstController.value = false;
    _secondController.value = false;
    _thirdController.value = false;
    _fourthController.value = false;
    _fifthController.value = false;
    _getController(index)!.value = true;
  }

  ExpandableController? _getController(int index) {
    switch (index) {
      case 1:
        return _firstController;
      case 2:
        return _secondController;
      case 3:
        return _thirdController;
      case 4:
        return _fourthController;
      case 5:
        return _fifthController;
    }
  }

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
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => _toggleExpandables(1),
                  child: _ExpandCard(
                    title: 'Что такое платформа QRching?',
                    body: loremIpsum,
                    controller: _firstController,
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => _toggleExpandables(2),
                  child: _ExpandCard(
                    title: 'Что такое QR-код?',
                    body: loremIpsum,
                    controller: _secondController,
                  ),
                ),
                InkWell(
                  onTap: () => _toggleExpandables(3),
                  child: _ExpandCard(
                    title: 'Что такое блокчейн?',
                    body: loremIpsum,
                    controller: _thirdController,
                  ),
                ),
                InkWell(
                  onTap: () => _toggleExpandables(4),
                  child: _ExpandCard(
                    title: 'Что такое хеш-функция?',
                    body: loremIpsum,
                    controller: _fourthController,
                  ),
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
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => _toggleExpandables(5),
                  child: _ExpandCard(
                    title:
                        'Что необходимо сделать, чтобы принять участие в розыгрыше?',
                    body: loremIpsum,
                    controller: _fifthController,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _fourthController.expanded = false;
                  },
                  child: Text('OK'),
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
  final ExpandableController controller;

  const _ExpandCard({Key? key,
    required this.title,
    required this.body,
    required this.controller})
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
        child: ScrollOnExpand(
          scrollOnExpand: true,
          scrollOnCollapse: false,
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
                    loremIpsum,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
