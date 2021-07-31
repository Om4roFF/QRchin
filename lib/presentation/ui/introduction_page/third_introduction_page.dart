import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qrching/presentation/utilities/custom_icons_icons.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  final content = const [
    ['Зайти в раздел ', 'Создать розыгрыш', CustomIcons.subtract],
    ['Заполнить и отправить форму заявки', null, null],
    ['Оплатить розыгрыш', null, null],
    ['Получить QR-код и разместить его на своей странице', null, null],
    [
      'Розыгрыш автоматически появится в обзоре \nрозыгрышей в указанное тобой время',
      null,
      null
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 70),
        child: Column(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: AutoSizeText(
                  'Создавай розыгрыши для увеличения посещаемости своего сайта или канала!',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  minFontSize: 16,
                  // style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 40, right: 40, bottom: 20),
                child: Image.asset('assets/images/main-3.png'),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Чтобы создать публичный розыгрыш тебе нужно:',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth < 450) {
                    return _ContentListView(
                      content: content,
                    );
                  } else {
                    return _ContentBigSize(
                      content: content,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContentListView extends StatelessWidget {
  final content;

  const _ContentListView({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: content.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 25),
            // EdgeInsets.all(8),
            child: Row(
              children: [
                ClipRRect(
                  child: Container(
                    color: Theme.of(context).dialogBackgroundColor,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(fontSize: 12),
                    ),
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${content[index][0]}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 12),
                        ),
                        content[index][1] != null
                            ? TextSpan(
                                text: '${content[index][1]}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        fontSize: 12),
                              )
                            : TextSpan(),
                        TextSpan(text: ' '),
                        WidgetSpan(
                          child: Icon(
                            content[index][2] != null
                                ? content[index][2]! as IconData
                                : null,
                            size: 15,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class _ContentBigSize extends StatelessWidget {
  final content;

  const _ContentBigSize({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: content.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 25),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${content[index][0]}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12),
                      ),
                      content[index][1] != null
                          ? TextSpan(
                        text: '${content[index][1]}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 12),
                      )
                          : TextSpan(),
                      TextSpan(text: ' '),
                      WidgetSpan(
                        child: Icon(
                          content[index][2] != null
                              ? content[index][2]! as IconData
                              : null,
                          size: 15,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
