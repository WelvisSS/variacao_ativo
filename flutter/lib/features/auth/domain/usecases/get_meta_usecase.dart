import 'package:dartz/dartz.dart';

import '../entities/meta_entity.dart';

abstract class GetMetaUseCase {
  Future<Either<Exception, MetaEntity>> call(
      String activeName, String interval, int period1, int period2);
}
