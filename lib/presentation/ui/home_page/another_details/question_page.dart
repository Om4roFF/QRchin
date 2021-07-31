
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
  late Map<int, ExpandableController> _controllers;

  late ExpandableController _firstController = ExpandableController();
  late ExpandableController _secondController = ExpandableController();
  late ExpandableController _thirdController = ExpandableController();
  late ExpandableController _fourthController = ExpandableController();
  late ExpandableController _fifthController = ExpandableController();

  bool isExpand = true;

  @override
  void initState() {
    super.initState();

    _controllers = {
      1: _firstController,
      2: _secondController,
      3: _thirdController,
      4: _fourthController,
      5: _fifthController,
    };

    _firstController.addListener(() {
      if (_firstController.value) {
        _toggle(1);
      }
    });
    _secondController.addListener(() {
      if (_secondController.value) {
        _toggle(2);
      }
    });
    _thirdController.addListener(() {
      if (_thirdController.value) {
        _toggle(3);
      }
    });
    _fourthController.addListener(() {
      if (_fourthController.value) {
        _toggle(4);
      }
    });
    _fifthController.addListener(() {
      if (_fifthController.value) {
        _toggle(5);
      }
    });
  }

  void _toggle(int index) {
    _controllers.forEach((key, controller) {
      if (key != index) {
        controller.value = false;
      }
    });
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
          leading: BackButton(),
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
                  controller: _firstController,
                ),
                _ExpandCard(
                  title: 'Что такое QR-код?',
                  body: loremIpsum,
                  controller: _secondController,
                ),
                _ExpandCard(
                  title: 'Что такое блокчейн?',
                  body: loremIpsum,
                  controller: _thirdController,
                ),
                _ExpandCard(
                  title: 'Что такое хеш-функция?',
                  body: loremIpsum,
                  controller: _fourthController,
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
                  controller: _fifthController,
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
        side: BorderSide(
          color: Colors.grey.withOpacity(0.1),
          width: 0.5,
        ),
      ),
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
          // builder: (context, firstWidget, secondWidget) {},
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
    );
  }
}
