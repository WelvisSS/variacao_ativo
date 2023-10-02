import 'package:dartz/dartz.dart';
import '../../domain/entities/finances_entity.dart';

abstract class GetVariationsDataSource {
  Future<Either<Exception, FinancesEntity>> call(
      String activeName, int period1, int period2);
}
