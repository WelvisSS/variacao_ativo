import 'package:dartz/dartz.dart';

import '../entities/finances_entity.dart';
import '../repositories/get_variations_repository.dart';
import 'get_variations_usecase.dart';

class GetVariationsUseCaseImp implements GetVariationsUseCase {
  final GetVariationsRepository _getVariationsRepository;
  GetVariationsUseCaseImp(this._getVariationsRepository);

  @override
  Future<Either<Exception, FinancesEntity>> call(String activeName) async {
    return await _getVariationsRepository(activeName);
  }
}
