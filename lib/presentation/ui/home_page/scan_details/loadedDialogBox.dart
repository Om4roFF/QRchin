import 'package:flutter/material.dart';
import 'package:qrching/domain/cubit/scanner_cubit/scanner_state.dart';
import 'package:qrching/presentation/ui/home_page/scan_details/dialog_box.dart';
import 'package:qrching/presentation/ui/home_page/scan_details/simple_dialog_box.dart';

class LoadedDialogBox extends StatelessWidget {
  final ScanStatus scanStatus;
  final String result;

  const LoadedDialogBox(
      {Key? key, required this.scanStatus, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (scanStatus) {
      case ScanStatus.Win:
        return DialogBox(
          assetImage: 'assets/images/victory.png',
          title: 'Ура, победа!!!',
          content: 'Мы рады сообщить тебе,'
              ' что тебя ждёт денежный приз в размере ХХХ ₽, €, \$,'
              ' BTC! Пожалуйста, укажи свои реквизиты,'
              ' чтобы мы знали, куда перевести твой выигрыш.'
              ' Мы используем твои данные только для выплаты'
              ' выигрыша и после этого сразу удалим.',
          buttonText: 'Далее',
          onTap: () {
            print('ONTap');
            Navigator.pop(context);
          },
        );
      case ScanStatus.Lose:
        return DialogBox(
          assetImage: 'assets/images/almost.png',
          title: 'Почти получилось!',
          content:
              'К сожалению, в этот раз твоё 12578 сканирование оказалось не выигрышным.\n'
              'Не отчаивайся – пробуй ещё и рано или\n '
              'поздно ты обязательно выиграешь! Желаем удачи!',
          buttonText: 'Хорошо',
          onTap: () {},
        );
      case ScanStatus.Simple:
        return SimpleDialogBox(content: result, buttonText: 'Хорошо');
      case ScanStatus.None:
        return Container(
          width: 1,
          height: 1,
          color: Colors.red,
        );
    }
  }
}
