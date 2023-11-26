import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/finances_entity.dart';
import '../../domain/usecases/get_variations_usecase.dart';

class ActiveVariationController {
  final GetVariationsUseCase _getVariationsUseCase;
  ActiveVariationController(this._getVariationsUseCase) {
    // getFinances();
    getFinances2();
  }

  ValueNotifier<List<double?>?> finances = ValueNotifier<List<double?>?>(null);
  ValueNotifier<List<double?>?> prices = ValueNotifier<List<double?>?>(null);
  ValueNotifier<String?> selectedActive = ValueNotifier<String?>(null);

  ValueNotifier<FinancesEntity?> financesInfo =
      ValueNotifier<FinancesEntity?>(null);

  List<String> datas = [];

  Future changeActive({String activeName = "PETR4"}) async {
    financesInfo.value = null;
    prices.value = null;
    await getFinances2(activeName: activeName);
  }

  Future getFinances2({String activeName = "PETR4"}) async {
    Either financesEntity = await _getVariationsUseCase(activeName);

    // Separando os dados recebidos
    financesEntity.fold(
      (error) {
        debugPrint(error.toString());
      },
      (financesEntity) {
        // Verifica se é o primeiro item, caso seja, obtem o valor de regularMarketPrice
        // que corresponde ao último valor lançado do ativo
        financesInfo.value = financesEntity;
      },
    );
  }

  // Future getFinances({String activeName = "PETR4"}) async {
  //   selectedActive.value = activeName;
  //   // Retorna uma lista de datas correspondente ao intervalo desejado de 30 dias, considerando apenas dias úteis
  //   List<DateTime> listaDeDatas = calcularDatas();
  //   List<double> chartPreviousClose = [];
  //   List<double> variacoes = [];

  //   // Percorre uma lista de datas que se inicia no dia atual e regride até o 30ª dia.
  //   for (var data in listaDeDatas.asMap().entries) {
  //     // Dia atual
  //     DateTime date =
  //         DateTime(data.value.year, data.value.month, data.value.day, 16, 0, 0);

  //     DateTime dateMinus = date.add(const Duration(days: 1));
  //     DateTime dateForm =
  //         DateTime(dateMinus.year, dateMinus.month, dateMinus.day, 16, 0, 0);

  //     // Transformando um intervalo de datas em timestramp, compatível ao formato da API
  //     int timestramp = (date.millisecondsSinceEpoch ~/ 1000) % 10000000000;
  //     int timestramp2 = (dateForm.millisecondsSinceEpoch ~/ 1000) % 10000000000;

  //     // Fazendo requisição na API
  //     Either financesEntity = await _getVariationsUseCase(activeName);

  //     // Separando os dados recebidos
  //     financesEntity.fold(
  //       (error) {
  //         debugPrint(error.toString());
  //       },
  //       (financesEntity) {
  //         // Verifica se é o primeiro item, caso seja, obtem o valor de regularMarketPrice
  //         // que corresponde ao último valor lançado do ativo
  //         chartPreviousClose.add(data.key == 0
  //             ? financesEntity.chart.result[0].meta.regularMarketPrice
  //             : financesEntity.chart.result[0].meta.chartPreviousClose);
  //         datas.add(DateFormat('dd/MM/yyyy').format(data.value));
  //       },
  //     );
  //   }

  //   // Calculando as variações de uma data para a outra com no máximo 1 dia de diferença
  //   for (int i = 0; i < chartPreviousClose.length - 1; i++) {
  //     variacoes.add(double.parse(
  //         (((chartPreviousClose[i] - chartPreviousClose[i + 1]) /
  //                     chartPreviousClose[i + 1]) *
  //                 100)
  //             .toStringAsFixed(2)));
  //   }

  //   prices.value = chartPreviousClose; // Valores da tabela
  //   finances.value = variacoes.reversed
  //       .toList(); //Invertdndo a ordem da lista dos valores do gráfico
  // }
}
