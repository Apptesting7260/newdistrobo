class AppUrl {
  static const String baseUrl="https://distrobo.com/wp-json/custom/";
  static const String loginApi = 'https://distrobo.com/wp-json/custom/v1/login';

  static const String ResetPassApi =
      'https://distrobo.com/wp-json/custom/v1/reset_password_mail_otp';

  static const String SignupApi =
      'https://distrobo.com/wp-json/custom/v1/registeration-form';

  static const String VerifyPageApi =
      'https://distrobo.com/wp-json/custom/v1/password_verify_otp';
  static const String createPass =
      '${baseUrl}v1/change_password';
  static const String homeApi =
      '${baseUrl}v1/home_api';
  static const String addwhishlist =
      '${baseUrl}v1/wishlist/add';
  static const String shopApi =
      '${baseUrl}v1/parent_categories';
static const String subCategarory =
      '${baseUrl}v1/get_sub_category';
  static const String pagenationApi =
      '${baseUrl}v1/category_product';
  static const String profileDetailsApi =
      '${baseUrl}v1/user_profile';
}
