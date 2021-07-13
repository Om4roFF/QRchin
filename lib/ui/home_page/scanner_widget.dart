import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scan/scan.dart';

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
        if (result != null)
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Data: $result',
              style: TextStyle(color: Colors.white),
            ),
          ),
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
                      icon: Icon(Icons.photo_size_select_actual_outlined),
                      onPressed: () async {
                        await controller?.pauseCamera();
                        PickedFile? pickedFile =
                            await _picker.getImage(source: ImageSource.gallery);
                        log('PICKED ${pickedFile!.path}');
                        // final String res = await scanner.scanPath(pickedFile!.path);
                        String? res = await Scan.parse(pickedFile.path);
                        log('RESULT: $res');
                        setState(() {
                          result = res;
                        });
                        await controller?.resumeCamera();
                      },
                      color: Theme.of(context).backgroundColor,
                    ),
                    IconButton(
                      icon: Icon(Icons.android),
                      color: Theme.of(context).backgroundColor,
                      onPressed: () async {
                        await controller?.toggleFlash();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.photo_size_select_actual_outlined),
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
        // FittedBox(
        //   fit: BoxFit.contain,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: <Widget>[
        //       if (result != null)
        //         Text(
        //             'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
        //       else
        //         Text('Scan a code'),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: <Widget>[
        //           Container(
        //             margin: EdgeInsets.all(8),
        //             child: ElevatedButton(
        //                 onPressed: () async {
        //                   await controller?.toggleFlash();
        //                   setState(() {});
        //                 },
        //                 child: FutureBuilder(
        //                   future: controller?.getFlashStatus(),
        //                   builder: (context, snapshot) {
        //                     return Text('Flash: ${snapshot.data}');
        //                   },
        //                 )),
        //           ),
        //           Container(
        //             margin: EdgeInsets.all(8),
        //             child: ElevatedButton(
        //                 onPressed: () async {
        //                   await controller?.flipCamera();
        //                   setState(() {});
        //                 },
        //                 child: FutureBuilder(
        //                   future: controller?.getCameraInfo(),
        //                   builder: (context, snapshot) {
        //                     if (snapshot.data != null) {
        //                       return Text(
        //                           'Camera facing ${describeEnum(snapshot.data!)}');
        //                     } else {
        //                       return Text('loading');
        //                     }
        //                   },
        //                 )),
        //           )
        //         ],
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: <Widget>[
        //           Container(
        //             margin: EdgeInsets.all(8),
        //             child: ElevatedButton(
        //               onPressed: () async {
        //                 await controller?.pauseCamera();
        //               },
        //               child: Text('pause', style: TextStyle(fontSize: 20)),
        //             ),
        //           ),
        //           Container(
        //             margin: EdgeInsets.all(8),
        //             child: ElevatedButton(
        //               onPressed: () async {
        //                 await controller?.resumeCamera();
        //               },
        //               child: Text('resume', style: TextStyle(fontSize: 20)),
        //             ),
        //           )
        //         ],
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }

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
