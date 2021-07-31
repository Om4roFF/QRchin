import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:qrching/presentation/utilities/header_widget.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Политика конфиденциальности',
          maxLines: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(content: 'Дата последней публикации 19.03.2021'),
            Padding(
              padding: const EdgeInsets.all(22),
              child: RichText(
                text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.normal),
                    children: [
                      TextSpan(
                        text: 'Согласие не обработку персональных данных',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '\n\n\n'),
                      TextSpan(
                          text:
                              'В настоящем заявлении о конфиденциальности указано,'
                              ' какую информацию мы собираем о тебе,'
                              ' для чего мы используем эту информацию'
                              ' и кому мы предоставляем эту информацию.'
                              ' Оно также определяет ваши права'
                              ' в отношении информации,'
                              ' а также перечень контактных лиц'
                              ' для получения дополнительной'
                              ' информации или направления запросов.'
                              ' Нажав на ссылки ниже, ты перейдешь к'
                              ' более подробной информации о разделах'
                              ' этого заявления:\n\n\n'
                              '‍- области применения заявления о конфиденциальности;\n\n'
                              '- получаемая нами информация;\n\n'
                              '- использование нами информации о тебе;\n\n'
                              '- правовые основания, используемые нами для обработки персональных данных;\n\n'
                              '- раскрытие твоей персональной информации;\n\n'
                              '- защита твоей персональной информации;\n\n'
                              '- твои права- право на подачу жалобы;\n\n'
                              '- твои права- право на подачу жалобы;\n\n'
                              '- внесение изменений в заявление о конфиденциальности.\n\n\n'),
                      TextSpan(
                        text:
                            'Области применения заявления о конфиденциальности\n\n',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            'В настоящем заявлении о конфиденциальности говорится о нашем стремлении защищать твою конфиденциальность и обрабатывать твою информацию открытым и прозрачным образом.',
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
