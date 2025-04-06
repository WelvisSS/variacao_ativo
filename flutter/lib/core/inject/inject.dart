import 'package:get_it/get_it.dart';

import '../../features/active_variation/data/datasources/get_variations_datasource.dart';
import '../../features/active_variation/data/datasources/remote/get_variations_remote_datasource.dart';
import '../../features/active_variation/data/repositories/get_variations_repository_imp.dart';
import '../../features/active_variation/domain/repositories/get_variations_repository.dart';
import '../../features/active_variation/domain/usecases/get_variations_usecase.dart';
import '../../features/active_variation/domain/usecases/get_variations_usecase_imp.dart';
import '../../features/active_variation/presentation/controllers/active_variation.dart';
import '../../features/auth/presentation/controllers/auth_controller.dart';
import '../data/services/dio_http_service_imp.dart';
import '../domain/services/http_service.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;
    // core
    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());
    // datasources
    getIt.registerLazySingleton<GetVariationsDataSource>(
      () => GetVariationsRemoteDatasourceImp(getIt()),
    );
    // repositories
    getIt.registerLazySingleton<GetVariationsRepository>(
      () => GetVariationsRepositoryImp(getIt()),
    );
    // usecases
    getIt.registerLazySingleton<GetVariationsUseCase>(
      () => GetVariationsUseCaseImp(getIt()),
    );
    // controllers
    getIt.registerLazySingleton<ActiveVariationController>(
      () => ActiveVariationController(getIt()),
    );

    getIt.registerLazySingleton<AuthController>(
      () => AuthController(),
    );
  }
}
