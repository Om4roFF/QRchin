import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrching/domain/cubit/scanner_cubit/scanner_cubit.dart';
import 'package:qrching/domain/cubit/scanner_cubit/scanner_state.dart';
import 'package:qrching/presentation/utilities/custom_icons_icons.dart';
import 'package:scan/scan.dart';

class ScannerWidget extends StatefulWidget {
  const ScannerWidget({Key? key}) : super(key: key);

  @override
  _ScannerWidgetState createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  late QRViewController? _controller;
  late GlobalKey _qrKey;
  late ImagePicker _picker;
  late ScannerCubit _scannerCubit;

  @override
  void initState() {
    super.initState();
    _picker = ImagePicker();
    _qrKey = GlobalKey(debugLabel: 'QR');
    _scannerCubit = BlocProvider.of<ScannerCubit>(context);
  } // In order to get hot reload to work we need to pause the camera if the platform

  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller!.pauseCamera();
    }
    _controller!.resumeCamera();
  }

  void _onGalleryPressed() async {
    await _controller?.pauseCamera();
    PickedFile? pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      String? res = await Scan.parse(pickedFile.path);
      _controller!.pauseCamera();
      _scannerCubit.scanQR(res!);
    }
    await _controller?.resumeCamera();
  }


  @override
  Widget build(BuildContext context) {
    return BlocListener<ScannerCubit, ScannerState>(
      listener: (context, state) {
        // if(state is )
        // TODO
      },
      child: Stack(
        children: <Widget>[
          _buildQrView(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ColoredBox(
                  color: Colors.white.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3, bottom: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: Icon(CustomIcons.gallery),
                          onPressed: _onGalleryPressed,
                          color: Theme
                              .of(context)
                              .backgroundColor,
                        ),
                        IconButton(
                          icon: Icon(CustomIcons.flash),
                          color: Theme
                              .of(context)
                              .backgroundColor,
                          onPressed: () async {
                            await _controller?.toggleFlash();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void _navigate(ScanStatus scanStatus) {
  //   showDialog(
  //     context: context,
  //     builder: (_) {
  //       switch (scanStatus) {
  //         case ScanStatus.Lose:
  //           return DialogBox(
  //             assetImage: 'assets/images/almost.png',
  //             title: 'Почти получилось!',
  //             content:
  //                 'К сожалению, в этот раз твоё 12578 сканирование оказалось не выигрышным.\n'
  //                 'Не отчаивайся – пробуй ещё и рано или\n '
  //                 'поздно ты обязательно выиграешь! Желаем удачи!',
  //             buttonText: 'Хорошо',
  //           );
  //         case ScanStatus.Win:
  //           return DialogBox(
  //             assetImage: 'assets/images/victory.png',
  //             title: 'Ура, победа!!!',
  //             content: 'Мы рады сообщить тебе,'
  //                 ' что тебя ждёт денежный приз в размере ХХХ ₽, €, \$,'
  //                 ' BTC! Пожалуйста, укажи свои реквизиты,'
  //                 ' чтобы мы знали, куда перевести твой выигрыш.'
  //                 ' Мы используем твои данные только для выплаты'
  //                 ' выигрыша и после этого сразу удалим.',
  //             buttonText: 'Далее',
  //           );
  //         case ScanStatus.Congrats:
  //           return DialogBox(
  //             assetImage: 'assets/images/grats.png',
  //             title: 'Благодарим за участие в наших розыгрышах!',
  //             content: 'Мы получили твои данные и'
  //                 ' постараемся как можно скорее'
  //                 ' сообщить тебе по E-Mail'
  //                 ' об успешной выплате твоего выигрыша.',
  //             buttonText: 'Хорошо',
  //           );
  //         case ScanStatus.Data:
  //           return DialogBox(
  //             assetImage: 'assets/images/almost.png',
  //             title: 'Почти получилось!',
  //             content:
  //                 'К сожалению, в этот раз твоё 12578 сканирование оказалось не выигрышным.\n'
  //                 'Не отчаивайся – пробуй ещё и рано или\n '
  //                 'поздно ты обязательно выиграешь! Желаем удачи!',
  //             buttonText: 'Хорошо',
  //           );
  //         case ScanStatus.Simple:
  //           return DialogBox(
  //             assetImage: 'assets/images/almost.png',
  //             title: 'Почти получилось!',
  //             content:
  //                 'К сожалению, в этот раз твоё 12578 сканирование оказалось не выигрышным.\n'
  //                 'Не отчаивайся – пробуй ещё и рано или\n '
  //                 'поздно ты обязательно выиграешь! Желаем удачи!',
  //             buttonText: 'Хорошо',
  //           );
  //       }
  //     },
  //   );
  // }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return QRView(
      key: _qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: width - 100),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this._controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      log('${scanData.code}');
      _scannerCubit.scanQR(scanData.code);
      controller.resumeCamera();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
