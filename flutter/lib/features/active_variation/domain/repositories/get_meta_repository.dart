import 'package:dartz/dartz.dart';
import '../entities/meta_entity.dart';

abstract class GetMetaRepository {
  Future<Either<Exception, MetaEntity>> call(
      String activeName, int period1, int period2);
}
