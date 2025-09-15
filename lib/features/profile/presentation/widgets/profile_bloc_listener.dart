import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/error_snackbar.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../controller/profile_cubit.dart';
import '../controller/profile_state.dart';

class ProfileBlocListener extends StatelessWidget {
  const ProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen:
          (previous, current) =>
              current is UpdateProfileLoading ||
              current is UpdateProfileSuccess ||
              current is UpdateProfileError,
      listener: (context, state) {
        switch (state) {
          case UpdateProfileLoading():
            showCustomLoading(context);
          case UpdateProfileSuccess():
            _setupSuccess(context);
          case UpdateProfileError():
            _setupError(context, state.error);
          default:
            const SizedBox.shrink();
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void _setupSuccess(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.pop(context);
  }

  void _setupError(BuildContext context, String? error) {
    Navigator.of(context, rootNavigator: true).pop();
    errorSnackbar(context, error);
  }
}
