import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/model/user_profile.dart';
import '../../domain/repo/profile_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileInitial());

  final ProfileRepo _profileRepo;
  UserProfile? profile;

  Future<void> getUserProfile() async {
    emit(ProfileLoading());
    final response = await _profileRepo.getUserProfile();
    switch (response) {
      case Success():
        profile = response.data;
        emit(ProfileSuccess(response.data));
      case Failure():
        emit(ProfileError(error: response.error));
    }
  }

  Future<void> updateProfile({
    String? name,
    String? email,
    String? phoneNumber,
    String? oldPassword,
    String? password,
  }) async {
    emit(UpdateProfileLoading());
    final response = await _profileRepo.updateProfile(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
    );
    switch (response) {
      case Success():
        profile = profile?.copyWith(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          oldPassword: oldPassword,
          password: password,
        );
        emit(UpdateProfileSuccess());
      case Failure():
        emit(UpdateProfileError(error: response.error));
    }
  }
}
