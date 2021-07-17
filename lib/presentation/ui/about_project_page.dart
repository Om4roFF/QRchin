import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrching/providers/application_provider.dart';

class AboutProjectPage extends StatelessWidget {
  final String nameOfCompany = 'QRching';
  final String aboutCompany =
      ' - это платформа, которая была создана для бесплатных розыгрышей,'
      ' на основе технологий блокчейн и QR-кодов, в интернете и вне его.'
      ' Мы позаботились о том, чтобы у участников розыгрышей были максимальные'
      ' условия комфорта и прозрачность участия:- мы являемся практически '
      'единственной платформой, которая предлагает собственные бесплатные розыгрыши'
      ' на легальной основе и мы несем ответственность за свои действия,'
      ' так как действуем официально и законно;- наша фирма находится в Германии,'
      ' а не где-то на Мальте - нам нечего скрывать и мы платим честно налоги;'
      '- мы единственная платформа с розыгрышами, которая использует технологию '
      'блокчейн для контроля прозрачности действий;- отсутствие рекламы на платформе'
      ' и в приложении для смартфона;- возможность участия во всех розыгрышах,'
      ' представленных в ';
  final String lastSentence = 'обзоре розыгрышей.';

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
          title: Text('О проекте'),
          leading: BackButton(
            onPressed: () {
              Provider.of<ApplicationProvider>(context, listen: false)
                  .setNavigationMenuIndex(4);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: const SizedBox(
                            height: 8.0,
                            child: const DecoratedBox(
                              decoration:
                                  const BoxDecoration(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: const SizedBox(
                          height: 8.0,
                          child: const DecoratedBox(
                            decoration: const BoxDecoration(color: Colors.red),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: const SizedBox(
                            height: 8.0,
                            child: const DecoratedBox(
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(243, 207, 71, 1)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "M A D E  I N  G E R M A N Y",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
                  child: SingleChildScrollView(
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: nameOfCompany,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: aboutCompany,
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                            TextSpan(
                              text: lastSentence,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ]),
                    ),
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
