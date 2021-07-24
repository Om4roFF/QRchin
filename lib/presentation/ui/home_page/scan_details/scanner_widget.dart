import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrching/domain/constants.dart';
import 'package:qrching/domain/model/history.dart';
import 'package:qrching/presentation/utilities/custom_icons_icons.dart';
import 'package:scan/scan.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannerWidget extends StatefulWidget {
  const ScannerWidget({Key? key}) : super(key: key);

  @override
  _ScannerWidgetState createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  String? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final ImagePicker _picker = ImagePicker();

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void _onGalleryPressed() async {
    await controller?.pauseCamera();
    PickedFile? pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      String? res = await Scan.parse(pickedFile.path);
      controller!.pauseCamera();
      _saveData(res!);
      _parseData(res);
    }
    await controller?.resumeCamera();
  }

  void _parseData(String result) async {
    final address = 'qrching.com';
    final isUrl = await canLaunch(result);
    if (isUrl) {
      if (result.contains(address)) {
      } else {
        await _launchURL(result);
      }
    }
  }

  void _saveData(String result) {
    Box<History> historyBox = Hive.box<History>(AppConstants.historyBox);
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd.MM.yyyy HH:mm');
    final String formatted = formatter.format(now);
    historyBox.add(
      History(date: formatted, url: result),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                        color: Theme.of(context).backgroundColor,
                      ),
                      IconButton(
                        icon: Icon(CustomIcons.flash),
                        color: Theme.of(context).backgroundColor,
                        onPressed: () async {
                          await controller?.toggleFlash();
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
    );
  }

  void _showDialog(String? result) async {
    final isUrl = await canLaunch(result!);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: InkWell(
          child: Text(
            '$result',
            style: TextStyle(color: isUrl ? Colors.blue : Colors.black),
          ),
          onTap: () {
            if (isUrl) _launchURL(result);
          },
        ),
        actions: [
          CloseButton(
            onPressed: () {
              controller!.resumeCamera();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async => await launch(url);

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    final width = MediaQuery.of(context).size.width;
    return QRView(
      key: qrKey,
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
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      log('${scanData.code}');
      _saveData(scanData.code);
      _parseData(scanData.code);
      // _showDialog(scanData.code);
      controller.resumeCamera();
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
