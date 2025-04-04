import 'package:dio/dio.dart';
import 'package:evoluton_x/core/services/api_services.dart';
import 'package:evoluton_x/core/services/cach_services.dart';
import 'package:evoluton_x/features/authentication/data/data_source/remote/auth_remote_data_source.dart';
import 'package:evoluton_x/features/authentication/data/data_source/remote/auth_remote_data_source_imp.dart';
import 'package:evoluton_x/features/authentication/data/repository/auth_repository_imp.dart';
import 'package:evoluton_x/features/authentication/domain/repository/auth_repository.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/delete_account_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/forget_password_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/login_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/logout_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/register_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/resend_code_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/reset_password_usecase.dart';
import 'package:evoluton_x/features/authentication/domain/usecases/verify_email_usecase.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/auth_bloc/auth_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/login_bloc/login_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/password_bloc/password_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/register_bloc/register_bloc.dart';
import 'package:evoluton_x/features/authentication/presentation/controllers/verify_email_bloc/verify_email_bloc.dart';
import 'package:evoluton_x/features/details/data/datasource/remote/details_remote_datasource.dart';
import 'package:evoluton_x/features/details/data/datasource/remote/details_remote_datasource_imp.dart';
import 'package:evoluton_x/features/details/data/repository/details_repository_imp.dart';
import 'package:evoluton_x/features/details/domain/repository/details_repository.dart';
import 'package:evoluton_x/features/details/domain/usecases/get_details_usecase.dart';
import 'package:evoluton_x/features/details/presentation/controllers/club_filter_bloc/club_filter_bloc.dart';
import 'package:evoluton_x/features/details/presentation/controllers/details_bloc/details_bloc.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_bloc.dart';
import 'package:evoluton_x/features/search/presentation/search_bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    // Dio instance
    getIt.registerLazySingleton<Dio>(
      () => Dio(
        BaseOptions(
          baseUrl: 'https://bpr601.trainees-mad-s.com/api/',
          receiveDataWhenStatusError: true,
        ),
      ),
    );

    //Api Service
    getIt.registerLazySingleton<ApiServices>(
      () => ApiServices(dio: getIt()),
    );

    //sharedPreferences
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(sharedPreferences);
    getIt.registerLazySingleton<CachServices>(
      () => CachServices(sharedPreferences: getIt<SharedPreferences>()),
    );

    //Bloc
    getIt.registerFactory<RegisterBloc>(
      () => RegisterBloc(
          registerUseCase: getIt<RegisterUseCase>(),
          loginUsecase: getIt<LoginUsecase>()),
    );
    getIt.registerFactory<VerifyEmailBloc>(
      () => VerifyEmailBloc(
          verifyEmailUseCase: getIt<VerifyEmailUseCase>(),
          resendCodeUseCase: getIt<ResendCodeUseCase>()),
    );
    getIt.registerFactory<LoginBloc>(
      () => LoginBloc(loginUsecase: getIt<LoginUsecase>()),
    );
    getIt.registerFactory<PasswordBloc>(
      () => PasswordBloc(
        forgetPasswordUsecase: getIt<ForgetPasswordUsecase>(),
        resetPasswordUsecase: getIt<ResetPasswordUsecase>(),
        verifyEmailUseCase: getIt<VerifyEmailUseCase>(),
        resendCodeUseCase: getIt<ResendCodeUseCase>(),
      ),
    );
    getIt.registerFactory<AuthBloc>(
      () => AuthBloc(
        logoutUsecase: getIt<LogoutUsecase>(),
        deleteAccountUsecase: getIt<DeleteAccountUsecase>(),
      ),
    );
    getIt.registerFactory<LayoutBloc>(
      () => LayoutBloc(),
    );
    getIt.registerFactory<DetailsBloc>(
      () => DetailsBloc(getDetailsUsecase: getIt<GetDetailsUsecase>()),
    );
    getIt.registerFactory<ClubFilterBloc>(
      () => ClubFilterBloc(),
    );
    getIt.registerFactory<SearchBloc>(
      () => SearchBloc(),
    );

    //DataSource
    getIt.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImp(apiServices: getIt<ApiServices>()));
    getIt.registerLazySingleton<DetailsRemoteDatasource>(
        () => DetailsRemoteDatasourceImp(apiServices: getIt<ApiServices>()));

    //Repository
    getIt.registerLazySingleton<AuthRepository>(() =>
        AuthRepositoryImp(authRemoteDataSource: getIt<AuthRemoteDataSource>()));
    getIt.registerLazySingleton<DetailsRepository>(() => DetailsRepositoryImp(
        detailsRemoteDatasource: getIt<DetailsRemoteDatasource>()));

    //usecases
    getIt.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(authRepository: getIt<AuthRepository>()),
    );
    getIt.registerLazySingleton<VerifyEmailUseCase>(
      () => VerifyEmailUseCase(authRepository: getIt<AuthRepository>()),
    );
    getIt.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(authRepository: getIt<AuthRepository>()),
    );
    getIt.registerLazySingleton<LogoutUsecase>(
      () => LogoutUsecase(authRepository: getIt<AuthRepository>()),
    );
    getIt.registerLazySingleton<DeleteAccountUsecase>(
      () => DeleteAccountUsecase(authRepository: getIt<AuthRepository>()),
    );
    getIt.registerLazySingleton<ForgetPasswordUsecase>(
      () => ForgetPasswordUsecase(authRepository: getIt<AuthRepository>()),
    );
    getIt.registerLazySingleton<ResetPasswordUsecase>(
      () => ResetPasswordUsecase(authRepository: getIt<AuthRepository>()),
    );
    getIt.registerLazySingleton<ResendCodeUseCase>(
      () => ResendCodeUseCase(authRepository: getIt<AuthRepository>()),
    );
    getIt.registerLazySingleton<GetDetailsUsecase>(
      () => GetDetailsUsecase(detailsRepository: getIt<DetailsRepository>()),
    );
  }
}
