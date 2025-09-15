import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/error_snackbar.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../controller/auth_cubit.dart';
import '../controller/auth_state.dart';

class VerifyOtpBlocListener extends StatelessWidget {
  const VerifyOtpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen:
          (previous, current) =>
              current is VerifyOtpLoading ||
              current is VerifyOtpSuccess ||
              current is VerifyOtpError,
      listener: (context, state) {
        switch (state) {
          case VerifyOtpLoading():
            showCustomLoading(context);
          case VerifyOtpSuccess():
            _setupSuccess(context);
          case VerifyOtpError():
            _setupError(context, state.error);
          default:
            const SizedBox.shrink();
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void _setupSuccess(BuildContext context) {
    context.pop();
    context.pop();
    context.pop();
  }

  void _setupError(BuildContext context, String? error) {
    context.pop();
    errorSnackbar(context, error);
  }
}
