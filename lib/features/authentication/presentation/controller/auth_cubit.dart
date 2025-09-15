import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/repo/auth_repo.dart';
import '../../domain/usecase/save_user_token_use_case.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo, this._saveUserTokenUseCase) : super(AuthInitial());

  final AuthRepo _authRepo;
  final SaveUserTokenUseCase _saveUserTokenUseCase;

  Future<void> signIn(String email) async {
    emit(SignInLoading());
    final response = await _authRepo.signIn(email);
    switch (response) {
      case Success():
        emit(SignInSuccess(email: email, otpKey: response.data.otpKey));
      case Failure():
        emit(SignInError(error: response.error));
    }
  }

  Future<void> verifyOtp(String email, String otpCode, String otpKey) async {
    emit(VerifyOtpLoading());
    final response = await _authRepo.verifyOtp(email, otpCode, otpKey);
    switch (response) {
      case Success():
        await _saveUserTokenUseCase(response.data.token);
        emit(VerifyOtpSuccess(data: response.data));
      case Failure():
        emit(VerifyOtpError(error: response.error));
    }
  }
}
