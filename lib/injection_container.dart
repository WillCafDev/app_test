import 'package:cawaf_services_api/api/app_config.dart';
import 'package:cawaf_services_api/cawaf_services_api.dart';
import 'package:get_it/get_it.dart';

import 'core/services_sl/context_global.dart';
import 'core/services_sl/user_services.dart';
import 'pages/login/view/login_vm.dart';
import 'pages/splash/view/splash_vm.dart';
import 'pages/synchronized/view.dart';

final GetIt sl = GetIt.instance;

Future<void> init(String env) async {
  await initDependency(env);
}

Future<void> initDependency(String env) async {
  setEnvironment(Environment.mock);

  sl
    //ViewModels
    ..registerFactory(() => LoginViewModel(sl()))
    ..registerFactory(SynchronizedViewModel.new)
    ..registerFactory(() => SplashViewModel(sl(), sl()))

    //usesCases
    ..registerLazySingleton(() => ClearSessionLocalUser(sl()))
    ..registerLazySingleton(() => GetSessionLocalUser(sl()))
    ..registerLazySingleton(() => SetSessionLocalUser(sl()))
    ..registerLazySingleton(() => ValidateWithCredentialUser(sl(), sl()))
    ..registerLazySingleton(() => GetInformationLocalUser(sl()))
    ..registerLazySingleton(() => SaveRemoteCompany(sl()))
    ..registerLazySingleton(() => GetRemoteEmployed(sl(), sl()))
    ..registerLazySingleton(() => GetRemoteSeller(sl(), sl()))
    ..registerLazySingleton(() => GetRemoteCustomer(sl(), sl()))
    //Repositories
    ..registerLazySingleton<SessionLocalRepository>(
        () => SessionLocalRepositoryImpl(sl()))
    ..registerLazySingleton<CompanyRemoteRepository>(
        () => CompanyRemoteRepositoryImpl(sl()))
    ..registerLazySingleton<EmployedRemoteRepository>(
        () => EmployedRemoteRepositoryImpl(sl()))
    ..registerLazySingleton<SellerRemoteRepository>(
        () => SellerRemoteRepositoryImpl(sl()))
    ..registerLazySingleton<CustomerRemoteRepository>(
        () => CustomerRemoteRepositoryImpl(sl()))
    ..registerLazySingleton<AuthenticationRemoteRepository>(
        () => AuthenticationRemoteRepositoryImpl(sl()))

    //datasources
    ..registerLazySingleton<SessionLocalDataSources>(
        SessionLocalDataSourcesImpl.new)
    ..registerLazySingleton<CompanyRemoteDataSources>(
        CompanyRemoteDataSourcesImpl.new)
    ..registerLazySingleton<EmployedRemoteDataSources>(
        EmployedRemoteDataSourcesImpl.new)
    ..registerLazySingleton<SellerRemoteDataSources>(
        SellerRemoteDataSourcesImpl.new)
    ..registerLazySingleton<CustomerRemoteDataSources>(
        CustomerRemoteDataSourcesImpl.new)
    ..registerLazySingleton<AuthenticationRemoteDataSources>(
        AuthenticationRemoteDataSourcesImpl.new)
    //services
    ..registerLazySingleton(UserServices.new)
    ..registerLazySingleton(ContextService.new);
}
