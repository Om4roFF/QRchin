import 'package:qrching/domain/cubit/scanner_cubit/scanner_cubit.dart';
import 'package:qrching/domain/cubit/scanner_cubit/scanner_state.dart';
import 'package:qrching/internal/dependencies/repository_module.dart';

class ScannerStateModule {
  static ScannerCubit scannerCubit() {
    return ScannerCubit(
        ScannerLoadingState(), RepositoryModule.clientRepository());
  }
}
