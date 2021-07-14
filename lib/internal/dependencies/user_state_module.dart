import 'package:qrching/domain/cubit/user_cubit.dart';
import 'package:qrching/domain/cubit/user_state.dart';
import 'package:qrching/internal/dependencies/repository_module.dart';

class UserStateModule {
  static UserCubit userCubit() {
    return UserCubit(RepositoryModule.clientRepository(),
        initialState: UserLoadingState());
  }
}
