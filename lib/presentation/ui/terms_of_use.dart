import 'package:flutter/material.dart';
import 'package:qrching/presentation/utilities/header_widget.dart';

class TermsOfUsePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Условия использования'),
      ),
      body: Column(
        children: [
          HeaderWidget(content: 'Дата последней публикации 19.03.2021'),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Text(
              'QRching (далее - Оператор) гарантирует,'
              ' что предоставленные посетителем или пользователем'
              ' персональные данные будут обработаны нами исключительно'
              ' при условии соблюдения всех требований законодательства'
              ' Федеративной Республики Германии о персональных данных,'
              ' а также в соответствии с политикой Оператора в отношении'
              ' организации обработки и обеспечения безопасности персональных данных,'
              ' и иными положениями/ политиками Оператора.',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.normal, wordSpacing: 3),
            ),
          ),
        ],
      ),
    );
  }
}
