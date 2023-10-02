import 'package:dartz/dartz.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/services/verify_internet_conection_repository.dart';

class VerifyInternetConectionRepositoryImp
    implements VerifyInternetConectionRepository {
  @override
  Future<Either<Exception, bool>> call() async {
    ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    try {
      // Verifica se existe conexão om a internet via dados móveis ou Wi-Fi.
      return Right(connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi);
    } catch (e) {
      return Left(Exception('Erro ao verificar conexão com a internet: $e'));
    }
  }
}
