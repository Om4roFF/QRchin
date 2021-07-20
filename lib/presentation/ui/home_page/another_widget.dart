import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/presentation/ui/privacy_policy.dart';
import 'package:qrching/presentation/utilities/custom_icons_icons.dart';
import 'package:qrching/providers/application_provider.dart';

import '../terms_of_use.dart';

class Title {
  final Icon icon;
  final String title;

  Title(this.icon, this.title);
}

class AnotherWidget extends StatelessWidget {
  final countOfMainWidgets;

  AnotherWidget({Key? key, this.countOfMainWidgets}) : super(key: key);

  final List<String> bottomText = [
    'Политика конфиденциальности',
    'Контактная информация',
    'Условия использования',
  ];

  final List<Title> titleNames = [
    Title(Icon(CustomIcons.main), 'О проекте'),
    Title(Icon(CustomIcons.winner), 'Победители'),
    Title(Icon(CustomIcons.statistics), 'Статистика'),
    Title(Icon(CustomIcons.social), 'Социальные сети'),
    Title(Icon(CustomIcons.question), 'Часто задаваемые вопросы'),
    Title(Icon(CustomIcons.contact), 'Обратная связь'),
    Title(Icon(CustomIcons.settings), 'Настройки'),
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
                        Provider.of<ApplicationProvider>(context, listen: false)
                            .setNavigationMenuIndex(index + 5);
                      },
                      dense: false,
                      title: Text(
                        titleNames[index].title,
                        style: TextStyle(fontSize: 14),
                      ),
                      leading: titleNames[index].icon,
                      trailing: Icon(Icons.arrow_forward_rounded),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: titleNames.length),
            ),
            _Links(
              title: 'Политика конфиденциальности',
              toRoute: PrivacyPolicyPage(),
            ),
            _Links(
              title: 'Контактная информация',
              toRoute: PrivacyPolicyPage(),
            ),
            _Links(
              title: 'Условия использования',
              toRoute: TermsOfUsePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Links extends StatelessWidget {
  final String title;
  final Widget toRoute;

  const _Links({Key? key, required this.title, required this.toRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        top: 18,
      ),
      child: InkWell(
        child: Text(
          '$title',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => toRoute,
            ),
          );
        },
      ),
    );
  }
}
