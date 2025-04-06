import 'package:dartz/dartz.dart';

import '../entities/finances_entity.dart';

abstract class GetVariationsRepository {
  Future<Either<Exception, FinancesEntity>> call(String activeName);
}
