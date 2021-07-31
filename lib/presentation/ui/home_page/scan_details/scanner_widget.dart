import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrching/domain/cubit/scanner_cubit/scanner_cubit.dart';
import 'package:qrching/domain/cubit/scanner_cubit/scanner_state.dart';
import 'package:qrching/presentation/ui/home_page/scan_details/error_dialog_box.dart';
import 'package:qrching/presentation/ui/home_page/scan_details/loadedDialogBox.dart';
import 'package:qrching/presentation/ui/home_page/scan_details/loading_dialog_box.dart';
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
      log(res!);
      if (res.isEmpty || res == '') {
        await _controller?.resumeCamera();
      } else {
        _scannerCubit.scanQR(res);
      }
    }
    Future.delayed(Duration(seconds: 1));
    await _controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ScannerCubit, ScannerState>(
      listener: (context, state) {
        if (state is ScannerErrorState) {
          log('Current state: Error');
          showDialog(context: context, builder: (context) => ErrorDialogBox());
        } else if (state is ScannerLoadingState) {
          log('Current state: Loading');
          showDialog(
            context: context,
            builder: (context) => LoadingDialogBox(),
          );
        } else if (state is ScannerLoadedState) {
          log('Current state: Loaded');
          if (state.scanStatus != ScanStatus.None) {
            showDialog(
              context: context,
              builder: (context) => LoadedDialogBox(
                scanStatus: state.scanStatus,
                result: state.qrCode,
              ),
            );
          } else {
            // Navigator.pop(context);
            // Provider.of<ApplicationProvider>(context, listen: false)
            //     .setNavigationMenuIndex(3);
          }
        }
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
                          color: Theme.of(context).backgroundColor,
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

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    final width = MediaQuery
        .of(context)
        .size
        .width;
    double qrWidth = 300;
    if (width > 500) qrWidth = width - 300;

    return QRView(
      key: _qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.white,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: qrWidth),
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
      Future.delayed(Duration(seconds: 1));
      controller.resumeCamera();
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
