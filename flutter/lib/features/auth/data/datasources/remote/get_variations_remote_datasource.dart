import 'package:dartz/dartz.dart';

import '../../../../../core/domain/services/http_service.dart';
import '../../../../../core/utils/api.utils.dart';
import '../../../domain/entities/finances_entity.dart';
import '../../dtos/finances_dto.dart';
import '../get_variations_datasource.dart';

class GetVariationsRemoteDatasourceImp implements GetVariationsDataSource {
  final HttpService _httpService;
  GetVariationsRemoteDatasourceImp(this._httpService);

  @override
  Future<Either<Exception, FinancesEntity>> call(String activeName) async {
    try {
      DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
      DateTime lastMonth = yesterday.subtract(const Duration(days: 45));

      var period1 = lastMonth.millisecondsSinceEpoch ~/ 1000;
      var period2 = yesterday.millisecondsSinceEpoch ~/ 1000;

      var result = await _httpService.get(
          API.REQUEST_VARIATIONS_BY_ACTIVE_IN_PERIOD(
              activeName, "1d", period1, period2));

      return Right(FinancesDto.fromJson(result.data));
    } catch (e) {
      return Left(Exception('Falha no datasource $e'));
    }
  }
}
