import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:qrching/domain/cubit/scanner_cubit/scanner_state.dart';
import 'package:qrching/domain/model/draws.dart';
import 'package:qrching/domain/model/history.dart';
import 'package:qrching/domain/repository/client_repository.dart';
import 'package:qrching/presentation/utilities/application.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit(ScannerState initialState, this._clientRepository)
      : super(initialState);

  final ClientRepository _clientRepository;

  void scanQR(String qrData) async {
    final String hash = Application.getClientHash();
    final address = 'qrching.com';
    try {
      final bool isUrl = await canLaunch(qrData);
      if (isUrl) {
        if (qrData.contains(address)) {
          log('QR CONTAIN ADDRESS');
          final Draws draws =
              await _clientRepository.scanQR(hash: hash, qrCode: qrData);
          if (draws.isError()) {
            log('Error message: ${draws.errorMessage}');
            emit(ScannerErrorState());
          }
          if (draws.winner)
            emit(ScannerLoadedState(ScanStatus.Win, qrData));
          else
            emit(ScannerLoadedState(ScanStatus.Lose, qrData));
        } else {
          await _launchURL(qrData);
          emit(ScannerLoadedState(ScanStatus.None, qrData));
        }
      } else {
        emit(ScannerLoadedState(ScanStatus.Simple, qrData));
      }
      _saveData(qrData);
    } catch (error) {
      log('ERROR QR SCANNING: ${error.toString()}');
      emit(ScannerErrorState());
    }
  }

  void _saveData(String result) {
    Box<History> historyBox = Hive.box<History>(Application.historyBox);
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd.MM.yyyy HH:mm');
    final String formatted = formatter.format(now);
    historyBox.add(
      History(date: formatted, url: result),
    );
  }

  Future<void> _launchURL(String url) async => await launch(url);
}
