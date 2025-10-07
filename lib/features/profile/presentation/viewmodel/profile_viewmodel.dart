import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tarcking_app/features/profile/presentation/viewmodel/states/profile_states.dart';

import '../../../../core/errors/api_result.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/usecases/get_profile_data_usecase.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  final GetProfileDataUseCase _getProfileDataUseCase;

  ProfileViewModel(this._getProfileDataUseCase) : super(ProfileInitialState());

  UserEntity? user;

  Future<void> getProfile() async {
    if (state is ProfileLoadingState) return;

    emit(ProfileLoadingState());

    try {
      final result = await _getProfileDataUseCase();

      switch (result) {
        case ApiSuccessResult(:final data):
          user = data;
          emit(ProfileSuccessState(data));
        case ApiErrorResult(:final errorMessage):
          emit(ProfileErrorState(errorMessage));
      }
    } catch (e) {
      emit(ProfileErrorState('Failed to load profile: $e'));
    }
  }

  void clearProfileCache() {
    user = null;
    emit(ProfileInitialState());
  }
}
