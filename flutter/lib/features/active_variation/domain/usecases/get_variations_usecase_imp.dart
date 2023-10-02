import 'package:dartz/dartz.dart';
import 'get_variations_usecase.dart';
import '../entities/finances_entity.dart';
import '../repositories/get_variations_repository.dart';

class GetVariationsUseCaseImp implements GetVariationsUseCase {
  final GetVariationsRepository _getVariationsRepository;
  GetVariationsUseCaseImp(this._getVariationsRepository);

  @override
  Future<Either<Exception, FinancesEntity>> call(
      String activeName, int period1, int period2) async {
    return await _getVariationsRepository(activeName, period1, period2);
  }
}
