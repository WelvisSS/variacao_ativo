import 'package:dartz/dartz.dart';

import '../../../../../core/domain/services/http_service.dart';
import '../../../../../core/utils/api.utils.dart';
import '../../../domain/entities/meta_entity.dart';
import '../../dtos/meta_dto.dart';
import '../get_meta_datasource.dart';

class GetVariationsRemoteDatasourceImp implements GetMetasDataSource {
  final HttpService _httpService;
  GetVariationsRemoteDatasourceImp(this._httpService);

  @override
  Future<Either<Exception, MetaEntity>> call(
      String activeName, String interval, int period1, int period2) async {
    try {
      var result = await _httpService.get(
          API.REQUEST_VARIATIONS_BY_ACTIVE_IN_PERIOD(
              activeName, interval, period1, period2));

      return Right(MetaDto.fromJson(result.data));
    } catch (e) {
      return Left(Exception('Falha no datasource'));
    }
  }
}
