import 'package:dartz/dartz.dart';
import '../../domain/entities/meta_entity.dart';

abstract class GetMetasDataSource {
  Future<Either<Exception, MetaEntity>> call(
      String activeName, int period1, int period2);
}
