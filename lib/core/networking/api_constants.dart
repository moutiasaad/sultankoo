class ApiConstants {
  ApiConstants._();

  // Base url
  static const String baseUrl = 'https://tshl.me/';
  static const String apiBaseUrl = '${baseUrl}api/store/sultankoo/';

  // Endpoints
  static const String login = 'login';
  static const String verifyOtp = 'verify-otp';

  static const String home = 'getHome';

  static const String categories = 'categories';
  static const String categoryProducts = 'categories/{categoryId}/products';

  static const String cart = 'cart';
  static const String cartAdd = 'cart/{productId}';
  static const String cartDecrease = 'cart/decrease/{productId}';
  static const String cartDelete = 'cart/{productId}';

  static const String orders = 'orders';
  static const String orderDetails = 'orders/{orderId}';

  static const String profile = 'profile';
  static const String updateProfile = 'profile/update';
}

class ApiErrors {
  static const String badRequestError = 'طلب غير صالح. حاول مرة أخرى.';
  static const String noContent = 'لا يوجد محتوى متاح.';
  static const String forbiddenError = 'تم رفض الوصول. ليس لديك إذن.';
  static const String unauthorizedError =
      'وصول غير مصرح به. يرجى تسجيل الدخول.';
  static const String notFoundError = 'المورد المطلوب غير موجود.';
  static const String conflictError = 'حدث تعارض. حاول مرة أخرى.';
  static const String internalServerError =
      'خطأ في الخادم الداخلي. حاول مرة أخرى لاحقًا.';
  static const String unknownError = 'حدث خطأ غير معروف. حاول مرة أخرى.';
  static const String timeoutError =
      'انتهت مهلة الطلب. يرجى التحقق من الاتصال والمحاولة مرة أخرى.';
  static const String defaultError = 'حدث خطأ. حاول مرة أخرى.';
  static const String cacheError =
      'فشل تحميل البيانات من ذاكرة التخزين المؤقت.';
  static const String noInternetError =
      'لا يوجد اتصال بالإنترنت. يرجى التحقق من الشبكة والمحاولة مرة أخرى.';
  static const String loadingMessage = 'جار التحميل... يرجى الانتظار.';
  static const String retryAgainMessage = 'حدث خطأ ما. حاول مرة أخرى.';
  static const String ok = 'حسنًا';
}
