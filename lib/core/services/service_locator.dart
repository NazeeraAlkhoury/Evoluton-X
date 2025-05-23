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
import 'package:evoluton_x/features/clubs/data/datasource/remote/club_remote_datasource.dart';
import 'package:evoluton_x/features/clubs/data/datasource/remote/club_remote_datasource_imp.dart';
import 'package:evoluton_x/features/clubs/data/repository/clubs_repository_imp.dart';
import 'package:evoluton_x/features/clubs/domain/repository/clubs_repository.dart';
import 'package:evoluton_x/features/clubs/domain/usecases/get_club_card_usecase.dart';
import 'package:evoluton_x/features/clubs/domain/usecases/get_clubs_usecase.dart';
import 'package:evoluton_x/features/clubs/domain/usecases/get_clubs_with_filter_usecase.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_bloc/club_bloc.dart';
import 'package:evoluton_x/features/favorite/domain/usecase/get_favorite_players.dart';
import 'package:evoluton_x/features/players/data/datasource/remote/player_remote_datasource.dart';
import 'package:evoluton_x/features/players/data/datasource/remote/player_remote_datasource_imp.dart';
import 'package:evoluton_x/features/players/data/repository/player_repository_imp.dart';
import 'package:evoluton_x/features/players/domain/repository/player_repository.dart';
import 'package:evoluton_x/features/players/domain/usecases/get_details_usecase.dart';
import 'package:evoluton_x/features/players/domain/usecases/get_player_details_usecase.dart';
import 'package:evoluton_x/features/players/domain/usecases/get_player_statistics_usecase.dart';
import 'package:evoluton_x/features/players/domain/usecases/get_prediction_result_usecase.dart';
import 'package:evoluton_x/features/clubs/presentation/controllers/club_filter_bloc/club_filter_bloc.dart';
import 'package:evoluton_x/features/players/presentation/controllers/player_bloc/player_bloc.dart';
import 'package:evoluton_x/features/favorite/data/datasource/remote/favorite_remote_datasource.dart';
import 'package:evoluton_x/features/favorite/data/datasource/remote/favorite_remote_datasource_imp.dart';
import 'package:evoluton_x/features/favorite/data/repository/favorite_repository_imp.dart';
import 'package:evoluton_x/features/favorite/domain/repository/favorite_repository.dart';
import 'package:evoluton_x/features/favorite/domain/usecase/add_player_to_favorite_usecase.dart';
import 'package:evoluton_x/features/favorite/domain/usecase/remove_player_from_favorite_usecase.dart';
import 'package:evoluton_x/features/favorite/presentation/controller/favorite%20_bloc/favorite_bloc.dart';
import 'package:evoluton_x/features/layout/presentation/controller/layout_bloc/layout_bloc.dart';
import 'package:evoluton_x/features/search/data/datasource/remote/search_remote_datasource.dart';
import 'package:evoluton_x/features/search/data/datasource/remote/search_remote_datasource_imp.dart';
import 'package:evoluton_x/features/search/data/repository/search_repository_imp.dart';
import 'package:evoluton_x/features/search/domain/repository/search_repository.dart';
import 'package:evoluton_x/features/search/domain/usecases/get_all_players_usecase.dart';
import 'package:evoluton_x/features/search/domain/usecases/search_usecase.dart';
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
    getIt.registerFactory<PlayerBloc>(
      () => PlayerBloc(
        getDetailsUsecase: getIt<GetDetailsUsecase>(),
        getPlayerDetailsUsecase: getIt<GetPlayerDetailsUsecase>(),
        getPlayerStatisticsUsecase: getIt<GetPlayerStatisticsUsecase>(),
        getPredictionResultUseCase: getIt<GetPredictionResultUseCase>(),
      ),
    );

    getIt.registerFactory<ClubBloc>(
      () => ClubBloc(
        getClubsUsecase: getIt<GetClubsUsecase>(),
        getClubCardUsecase: getIt<GetClubCardUsecase>(),
      ),
    );
    getIt.registerFactory<ClubFilterBloc>(
      () => ClubFilterBloc(
          getClubsWithFilterUsecase: getIt<GetClubsWithFilterUsecase>()),
    );

    getIt.registerFactory<FavoriteBloc>(
      () => FavoriteBloc(
        addPlayerToFavoriteUsecase: getIt<AddPlayerToFavoriteUsecase>(),
        removePlayerFromFavoriteUsecase:
            getIt<RemovePlayerFromFavoriteUsecase>(),
        getFavoritePlayersUsecase: getIt<GetFavoritePlayersUsecase>(),
      ),
    );
    getIt.registerFactory<SearchBloc>(
      () => SearchBloc(
          searchUsecase: getIt<SearchUsecase>(),
          getAllPlayersUsecase: getIt<GetAllPlayersUsecase>()),
    );

    //DataSource
    getIt.registerLazySingleton<AuthRemoteDataSource>(
        () => AuthRemoteDataSourceImp(apiServices: getIt<ApiServices>()));
    getIt.registerLazySingleton<PlayerRemoteDatasource>(
        () => PlayerRemoteDatasourceImp(apiServices: getIt<ApiServices>()));
    getIt.registerLazySingleton<FavoriteRemoteDatasource>(
        () => FavoriteRemoteDatasourceImp(apiServices: getIt<ApiServices>()));
    getIt.registerLazySingleton<ClubRemoteDatasource>(
        () => ClubRemoteDatasourceImp(apiServices: getIt<ApiServices>()));
    getIt.registerLazySingleton<SearchRemoteDatasource>(
        () => SearchRemoteDatasourceImp(apiServices: getIt<ApiServices>()));

    //Repository
    getIt.registerLazySingleton<AuthRepository>(() =>
        AuthRepositoryImp(authRemoteDataSource: getIt<AuthRemoteDataSource>()));
    getIt.registerLazySingleton<PlayerRepository>(() => PlayerRepositoryImp(
        playerRemoteDatasource: getIt<PlayerRemoteDatasource>()));
    getIt.registerLazySingleton<FavoriteRepository>(() => FavoriteRepositoryImp(
        favoritRemoteDatasource: getIt<FavoriteRemoteDatasource>()));
    getIt.registerLazySingleton<ClubsRepository>(() => ClubsRepositoryImp(
        clubRemoteDatasource: getIt<ClubRemoteDatasource>()));
    getIt.registerLazySingleton<SearchRepository>(() => SearchRepositoryImp(
        searchRemoteDatasource: getIt<SearchRemoteDatasource>()));

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
      () => GetDetailsUsecase(playerRepository: getIt<PlayerRepository>()),
    );
    getIt.registerLazySingleton<GetPlayerDetailsUsecase>(
      () =>
          GetPlayerDetailsUsecase(playerRepository: getIt<PlayerRepository>()),
    );
    getIt.registerLazySingleton<GetPlayerStatisticsUsecase>(
      () => GetPlayerStatisticsUsecase(
          playerRepository: getIt<PlayerRepository>()),
    );
    getIt.registerLazySingleton<GetPredictionResultUseCase>(
      () => GetPredictionResultUseCase(
          playerRepository: getIt<PlayerRepository>()),
    );
    getIt.registerLazySingleton<AddPlayerToFavoriteUsecase>(
      () => AddPlayerToFavoriteUsecase(
          favoriteRepository: getIt<FavoriteRepository>()),
    );
    getIt.registerLazySingleton<RemovePlayerFromFavoriteUsecase>(
      () => RemovePlayerFromFavoriteUsecase(
          favoriteRepository: getIt<FavoriteRepository>()),
    );
    getIt.registerLazySingleton<GetClubsUsecase>(
      () => GetClubsUsecase(clubsRepository: getIt<ClubsRepository>()),
    );
    getIt.registerLazySingleton<GetClubsWithFilterUsecase>(
      () =>
          GetClubsWithFilterUsecase(clubsRepository: getIt<ClubsRepository>()),
    );
    getIt.registerLazySingleton<GetFavoritePlayersUsecase>(
      () => GetFavoritePlayersUsecase(
          favoriteRepository: getIt<FavoriteRepository>()),
    );
    getIt.registerLazySingleton<GetClubCardUsecase>(
      () => GetClubCardUsecase(clubsRepository: getIt<ClubsRepository>()),
    );
    getIt.registerLazySingleton<SearchUsecase>(
      () => SearchUsecase(searchRepository: getIt<SearchRepository>()),
    );
    getIt.registerLazySingleton<GetAllPlayersUsecase>(
      () => GetAllPlayersUsecase(searchRepository: getIt<SearchRepository>()),
    );
  }
}
