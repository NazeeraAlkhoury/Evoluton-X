abstract class EndPoints {
  static const String register = 'auth/register';
  static const String verifyEmail = 'auth/verify-email';
  static const String resendCode = 'auth/resend-code';
  static const String login = 'auth/login';
  static const String logOut = 'auth/logout';
  static const String deleteAccount = 'auth/users';
  static const String forgetPassword = 'auth/forgot-password';
  static const String resetPassword = 'auth/reset-password';

  static const String detailsScreen = 'players/details-screen';
  static String playerDetails({required int id}) => 'players/details/$id';
  static String playerStatistics({required int id}) => 'players/statistics/$id';
  static String playersPrediction({required int id}) =>
      'players/prediction/$id';

  static const String clubs = 'clubs';
  static String clubCard({required num id}) => 'clubs/$id';

  static const String favorites = 'favorites';
  static String removeFav({required num id}) => 'favorites/$id';
}
