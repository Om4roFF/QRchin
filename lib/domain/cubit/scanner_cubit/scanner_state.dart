enum ScanStatus {
  Win,
  Lose,
  Simple,
  None,
}

abstract class ScannerState {}

class ScannerLoadedState extends ScannerState {
  ScanStatus scanStatus;

  ScannerLoadedState(this.scanStatus);
}

class ScannerErrorState extends ScannerState {}

class ScannerLoadingState extends ScannerState {}
