import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/utils/error_snackbar.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../controller/auth_cubit.dart';
import '../controller/auth_state.dart';

class SignInBlocListener extends StatelessWidget {
  const SignInBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen:
          (previous, current) =>
              current is SignInLoading ||
              current is SignInSuccess ||
              current is SignInError,
      listener: (context, state) {
        switch (state) {
          case SignInLoading():
            showCustomLoading(context);
          case SignInSuccess():
            _setupSuccess(context, state.email, state.otpKey);
          case SignInError():
            _setupError(context, state.error);
          default:
            const SizedBox.shrink();
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void _setupSuccess(BuildContext context, String email, String otpKey) {
    context.pop();
    context.push(
      Uri(
        path: Routes.verifyOtp,
        queryParameters: {'email': email, 'otpKey': otpKey},
      ).toString(),
    );
  }

  void _setupError(BuildContext context, String? error) {
    context.pop();
    errorSnackbar(context, error);
  }
}
