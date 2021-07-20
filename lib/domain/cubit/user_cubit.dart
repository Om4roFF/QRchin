import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qrching/domain/cubit/user_state.dart';
import 'package:qrching/domain/model/client.dart';
import 'package:qrching/domain/repository/client_repository.dart';
import 'package:qrching/presentation/utilities/application.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this._clientRepository,
      {UserState? initialState,
      String? hash,
      String? language,
      required String country})
      : _hash = hash,
        _language = language,
        _country = country,
        super(initialState!);
  final ClientRepository _clientRepository;
  late String? _hash;
  late String? _language;
  late String _country;

  void initializeClientData() async {
    final bool isClient = await Application.isClient();
    if (isClient) {
      _hash = await Application.getClientHash();
      _language = await Application.getLanguage();
      emit(UserLoadedState());
    } else {
      _createClient();
    }
  }

  void _createClient() async {
    try {
      emit(UserLoadingState());
      final Client client = await _clientRepository.createClient(
          hash: _hash, language: _language, country: _country);
      log('CLIENT RESPONSE: ${client.toString()}');
      if (client.errorMessage != null)
        emit(UserErrorState());
      else {
        emit(UserLoadedState());
        await Application.setClientHash(client.hash);
      }
    } catch (e) {
      log('ERROR: ${e.toString()}');
      emit(UserErrorState());
    }
  }
}
