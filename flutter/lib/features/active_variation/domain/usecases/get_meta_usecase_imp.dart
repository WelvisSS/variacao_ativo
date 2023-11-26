import 'package:dartz/dartz.dart';

import '../entities/meta_entity.dart';
import '../repositories/get_meta_repository.dart';
import 'get_meta_usecase.dart';

class GetMetaUseCaseImp implements GetMetaUseCase {
  final GetMetaRepository _getMetaRepository;
  GetMetaUseCaseImp(this._getMetaRepository);

  @override
  Future<Either<Exception, MetaEntity>> call(
      String activeName, String interval, int period1, int period2) async {
    return await _getMetaRepository(activeName, interval, period1, period2);
  }
}
