sealed class AuthState<T> {}

class AuthInitial<T> extends AuthState<T> {}

class SignInLoading<T> extends AuthState<T> {}

class SignInSuccess<T> extends AuthState<T> {
  final String email;
  final String otpKey;

  SignInSuccess({required this.email, required this.otpKey});
}

class SignInError<T> extends AuthState<T> {
  final String? error;

  SignInError({required this.error});
}

class VerifyOtpLoading<T> extends AuthState<T> {}

class VerifyOtpSuccess<T> extends AuthState<T> {
  final T? data;

  VerifyOtpSuccess({this.data});
}

class VerifyOtpError<T> extends AuthState<T> {
  final String? error;

  VerifyOtpError({required this.error});
}
