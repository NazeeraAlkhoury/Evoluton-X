import 'package:evoluton_x/core/services/cach_services.dart';
import 'package:evoluton_x/core/services/service_locator.dart';

abstract class AppConstants {
  static const String onBoardingSeen = 'onBoardingSeen';
  static const String token = 'token';
  static const String name = 'name';

  static String? tokenSaved =
      getIt<CachServices>().getData(key: AppConstants.token);
}
