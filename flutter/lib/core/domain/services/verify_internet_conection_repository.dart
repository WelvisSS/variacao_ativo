import 'package:dartz/dartz.dart';

abstract class VerifyInternetConectionRepository {
  Future<Either<Exception, bool>> call();
}
