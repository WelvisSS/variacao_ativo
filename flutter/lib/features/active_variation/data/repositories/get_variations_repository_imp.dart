import 'package:dartz/dartz.dart';
import '../../domain/entities/finances_entity.dart';
import '../datasources/get_variations_datasource.dart';
import '../../domain/repositories/get_variations_repository.dart';

class GetVariationsRepositoryImp implements GetVariationsRepository {
  final GetVariationsDataSource _getVariationsDataSource;
  GetVariationsRepositoryImp(this._getVariationsDataSource);

  @override
  Future<Either<Exception, FinancesEntity>> call(
      String activeName, int period1, int period2) async {
    return await _getVariationsDataSource(activeName, period1, period2);
  }
}
