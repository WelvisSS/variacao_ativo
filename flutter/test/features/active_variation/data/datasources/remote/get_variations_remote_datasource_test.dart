import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:variacao_ativo_module/core/data/services/dio_http_service_imp.dart';
import 'package:variacao_ativo_module/features/active_variation/domain/entities/quote_entity.dart';
import 'package:variacao_ativo_module/features/active_variation/domain/entities/chart_entity.dart';
import 'package:variacao_ativo_module/features/active_variation/domain/entities/result_entity.dart';
import 'package:variacao_ativo_module/features/active_variation/domain/entities/finances_entity.dart';
import 'package:variacao_ativo_module/features/active_variation/domain/entities/indicators_entity.dart';
import 'package:variacao_ativo_module/features/active_variation/domain/usecases/get_variations_usecase.dart';
import 'package:variacao_ativo_module/features/active_variation/domain/usecases/get_variations_usecase_imp.dart';
import 'package:variacao_ativo_module/features/active_variation/data/repositories/get_variations_repository_imp.dart';
import 'package:variacao_ativo_module/features/active_variation/data/datasources/remote/get_variations_remote_datasource.dart';

main() {
  group('Testes de conexão com a API', () {
    late Either financesEntity;
    late GetVariationsUseCase getVariationsUseCase;
    setUp(() async {
      // Código a ser executado antes de cada teste no grupo
      getVariationsUseCase = GetVariationsUseCaseImp(
        GetVariationsRepositoryImp(
          GetVariationsRemoteDatasourceImp(
            DioHttpServiceImp(),
          ),
        ),
      );
      financesEntity =
          await getVariationsUseCase("PETR4", 1694545200, 1695150000);
    });

    test('Verifica se um financesEntity está sendo retornado', () async {
      financesEntity.fold(
        (error) => expect(false, true),
        (financesEntity) => expect(financesEntity, isA<FinancesEntity>()),
      );
    });

    test('Verifica se um ChartEntity está sendo retornado', () async {
      financesEntity.fold(
        (error) => expect(false, true),
        (financesEntity) => expect(financesEntity.chart, isA<ChartEntity>()),
      );
    });

    test('Verifica se um List<ResultEntity> está sendo retornado', () async {
      financesEntity.fold(
        (error) => expect(false, true),
        (financesEntity) =>
            expect(financesEntity.chart.result, isA<List<ResultEntity>>()),
      );
    });

    test('Verifica se um IndicatorsEntity está sendo retornado', () async {
      financesEntity.fold(
        (error) => expect(false, true),
        (financesEntity) => expect(
            financesEntity.chart.result[0].indicators, isA<IndicatorsEntity>()),
      );
    });

    test('Verifica se um List<QuoteEntity> está sendo retornado', () async {
      financesEntity.fold(
        (error) => expect(false, true),
        (financesEntity) => expect(
            financesEntity.chart.result[0].indicators.quote,
            isA<List<QuoteEntity>>()),
      );
    });

    test('Verifica se uma lista de double está sendo retornado', () async {
      financesEntity.fold(
        (error) => expect(false, true),
        (financesEntity) => expect(
            financesEntity.chart.result[0].indicators.quote[0].open,
            isA<List<double?>>()),
      );
    });
  });
}
