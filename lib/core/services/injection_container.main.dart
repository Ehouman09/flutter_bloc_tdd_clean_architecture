part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {


  await _initOnBoardingInit();
  await _initAuth();

}

Future<void> _initAuth() async{
  
  sl
    ..registerFactory(
          () => AuthBloc(
              signIn: sl(),
              signUp: sl(),
              forgotPassword: sl(),
              updateUser: sl()
          ),
  )
    ..registerLazySingleton(() => SignIn(sl()))
    ..registerLazySingleton(() => SignUp(sl()))
    ..registerLazySingleton(() => ForgotPassword(sl()))
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(() =>AuthRemoteDataSourceImpl(
        authClient: sl(),
        cloudStoreClient: sl(),
        dbClient: sl(),
    ),)..registerLazySingleton(() => FirebaseAuth.instance)
    ..registerLazySingleton(() => FirebaseStorage.instance)
    ..registerLazySingleton(() => FirebaseFirestore.instance);


}


Future<void> _initOnBoardingInit() async {

  final prefs = await SharedPreferences.getInstance();
  // Feature --> OnBoarding
  // Business Logic
  sl
    ..registerFactory(
          () => OnBoardingCubit(
        cacheFirstTimer: sl(),
        checkIfUserIsFirstTimer: sl(),
      ),
    )
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))
    ..registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(sl()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(
          () => OnBoardingLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton(() => prefs);

}
