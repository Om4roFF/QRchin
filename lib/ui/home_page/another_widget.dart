import 'package:flutter/material.dart';
import 'package:qrching/utilities/custom_icons_icons.dart';

class AnotherWidget extends StatelessWidget {
  AnotherWidget({Key? key}) : super(key: key);

  final List<String> bottomText = [
    'Политика конфиденциальности',
    'Контактная информация',
    'Условия использования',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Text(
                  'Ещё',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        print('hh');
                      },
                      dense: false,
                      title: Text(
                        "О проекте",
                        style: TextStyle(fontSize: 14),
                      ),
                      leading: Icon(CustomIcons.group),
                      trailing: Icon(Icons.arrow_forward_rounded),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: 7),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 21, vertical: 20),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Text(
                        bottomText[index],
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: bottomText.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
