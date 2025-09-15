import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/error_snackbar.dart';
import '../../domain/model/user_profile.dart';
import '../controller/profile_cubit.dart';
import '../controller/profile_state.dart';
import 'profile_view.dart';

class ProfileBlocConsumer extends StatelessWidget {
  const ProfileBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      buildWhen:
          (previous, current) =>
              current is ProfileLoading ||
              current is ProfileSuccess ||
              current is ProfileError,
      builder: (context, state) {
        switch (state) {
          case ProfileLoading():
            return const Center(child: CircularProgressIndicator());
          case ProfileSuccess():
            return _setupSuccess(state.userProfile);
          default:
            return const SizedBox.shrink();
        }
      },
      listenWhen: (previous, current) => current is ProfileError,
      listener: (context, state) {
        switch (state) {
          case ProfileError():
            _setupError(context, state.error);
          default:
        }
      },
    );
  }

  Widget _setupSuccess(UserProfile userProfile) {
    return ProfileView(profile: userProfile);
  }

  void _setupError(BuildContext context, String? error) {
    errorSnackbar(context, error);
  }
}
