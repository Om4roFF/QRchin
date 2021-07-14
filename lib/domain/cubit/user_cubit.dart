import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrching/domain/cubit/user_state.dart';
import 'package:qrching/domain/model/client.dart';
import 'package:qrching/domain/repository/client_repository.dart';
import 'package:qrching/presentation/utilities/application.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._clientRepository, {UserState? initialState})
      : super(initialState!);
  final ClientRepository _clientRepository;

  void initClient({String? hash, String? language, String? country}) async {
    try {
      if (hash == null || language == null || country == null) {
        final bool isClient = await Application.isClient();
        if (isClient) emit(UserLoadedState());
      } else {
        log('TRYING TO INIT CLIENT------------------>');
        emit(UserLoadingState());
        final Client client = await _clientRepository.createClient(
            hash: hash, language: language, country: country);
        log('CLIENT RESPONSE: ${client.toString()}');
        if (client.errorMessage != null)
          emit(UserErrorState());
        else {
          emit(UserLoadedState());
        }
        await Application.setClientHash(client.hash);
      }
    } catch (e) {
      log('ERROR: ${e.toString()}');
      emit(UserErrorState());
    }
  }
}
