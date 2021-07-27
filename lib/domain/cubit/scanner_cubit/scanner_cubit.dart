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
    emit(ScannerLoadingState());
    var box = Hive.box(Application.applicationBox);
    final String hash = box.get(Application.getClientHash());
    final address = 'qrching.com';

    try {
      final bool isUrl = await canLaunch(qrData);
      if (isUrl) {
        if (qrData.contains(address)) {
          final Draws draws =
              await _clientRepository.scanQR(hash: hash, qrCode: qrData);
          if (draws.isError()) {
            emit(ScannerErrorState());
          }
          if (draws.winner)
            emit(ScannerLoadedState(ScanStatus.Win));
          else
            emit(ScannerLoadedState(ScanStatus.Lose));
        } else {
          await _launchURL(qrData);
          emit(ScannerLoadedState(ScanStatus.None));
        }
      } else {
        emit(ScannerLoadedState(ScanStatus.Simple));
      }
      _saveData(qrData);
    } catch (error) {
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
