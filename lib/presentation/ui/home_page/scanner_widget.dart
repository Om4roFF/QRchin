import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
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
  double cutSize = 150;

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

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildQrView(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 13),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ColoredBox(
                color: Colors.white.withOpacity(0.3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(CustomIcons.gallery),
                      onPressed: () async {
                        await controller?.pauseCamera();
                        PickedFile? pickedFile =
                            await _picker.getImage(source: ImageSource.gallery);
                        // final String res = await scanner.scanPath(pickedFile!.path);

                        if (pickedFile != null) {
                          log('PICKED ${pickedFile.path}');
                          String? res = await Scan.parse(pickedFile.path);
                          log('RESULT: $res');
                          controller!.pauseCamera();
                          _showDialog(res);
                          setState(() {
                            result = res;
                          });
                        }
                        await controller?.resumeCamera();
                      },
                      color: Theme.of(context).backgroundColor,
                    ),
                    IconButton(
                      icon: Icon(CustomIcons.flash),
                      color: Theme
                          .of(context)
                          .backgroundColor,
                      onPressed: () async {
                        await controller?.toggleFlash();
                      },
                    ),
                    IconButton(
                      icon: Icon(CustomIcons.doublex),
                      onPressed: () {
                        if (cutSize == 150) {
                          setState(() {
                            cutSize = 300;
                          });
                        } else {
                          setState(() {
                            cutSize = 150;
                          });
                        }
                      },
                      color: Theme.of(context).backgroundColor,
                    ),
                  ],
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
    showDialog(context: context, builder: (_) =>
        AlertDialog(
          content: InkWell(child: Text('$result',
            style: TextStyle(color: isUrl ? Colors.blue : Colors.black),),
            onTap: () {
              if (isUrl)
                _launchURL(result);
            },),
          actions: [
            CloseButton(
              onPressed: () {
                controller!.resumeCamera();
                Navigator.pop(context);
              },
            ),
          ],
        ),);
  }

  Future<void> _launchURL(String url) async => await launch(url);


  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: cutSize),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      _showDialog(scanData.code);

      setState(() {
        result = scanData.code;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
