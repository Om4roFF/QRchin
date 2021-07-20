import 'package:flutter/material.dart';
import 'package:qrching/presentation/utilities/custom_icons_icons.dart';

class SecondPage extends StatelessWidget {
  final content = const [
    ['Зайти в раздел ', 'Обзор розыгрышей', CustomIcons.cup],
    ['Перейти по одной из ссылок непосредственно к розыгрышу', null, null],
    [
      'Найти QR-код и сохранить его в галерею или отобразить на экране компьютера',
      null,
      null
    ],
    ['Отсканировать QR-код с помощью ', 'Сканера', CustomIcons.main],
  ];

  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 70, left: 0, right: 0, bottom: 0),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Text(
                  'Участвуй в бесплатных розыгрышах и выигрывай денежные призы по всему миру!',
                  textAlign: TextAlign.center,
                  // style: Theme.of(context).textTheme.subtitle1,
                  // maxLines: 3,
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 20),
                child: Image.asset('assets/images/main-1.png'),
              ),
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'Чтобы принять участие в розыгрыше тебе нужно:',
                    // style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth < 450) {
                  return _ContentListView(content: content);
                } else {
                  return _ContentBigSize(
                    content: content,
                  );
                }
              }),
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
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${content[index][0]}',
                          style: Theme.of(context).textTheme.bodyText2,
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
              ],
            ),
          );
        });
  }
}
