import 'package:dartz/dartz.dart';
import '../../dtos/finances_dto.dart';
import '../get_variations_datasource.dart';
import '../../../../../core/utils/api.utils.dart';
import '../../../domain/entities/finances_entity.dart';
import '../../../../../core/domain/services/http_service.dart';

class GetVariationsRemoteDatasourceImp implements GetVariationsDataSource {
  final HttpService _httpService;
  GetVariationsRemoteDatasourceImp(this._httpService);

  @override
  Future<Either<Exception, FinancesEntity>> call(
      String activeName, int period1, int period2) async {
    try {
      var result = await _httpService.get(
          API.REQUEST_VARIATIONS_BY_ACTIVE_IN_PERIOD(
              activeName, period1, period2));

      return Right(FinancesDto.fromJson(result.data));
    } catch (e) {
      return Left(Exception('Falha no datasource'));
    }
  }
}
