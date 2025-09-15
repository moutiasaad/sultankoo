import '../../domain/model/user_profile.dart';

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserProfile userProfile;

  ProfileSuccess(this.userProfile);
}

class ProfileError extends ProfileState {
  final String? error;

  ProfileError({required this.error});
}

class UpdateProfileLoading extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {}

class UpdateProfileError extends ProfileState {
  final String? error;

  UpdateProfileError({required this.error});
}
