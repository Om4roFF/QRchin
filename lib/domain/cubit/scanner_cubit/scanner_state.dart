enum ScanStatus {
  Win,
  Lose,
  Simple,
  None,
}

abstract class ScannerState {}

class ScannerLoadedState extends ScannerState {
  final ScanStatus scanStatus;
  final String qrCode;

  ScannerLoadedState(this.scanStatus, this.qrCode);
}

class ScannerErrorState extends ScannerState {}

class ScannerLoadingState extends ScannerState {}
