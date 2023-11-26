class API {
  // ignore: non_constant_identifier_names
  static String REQUEST_VARIATIONS_BY_ACTIVE_IN_PERIOD(
          String activeName, String interval, int period1, int period2) =>
      'v8/finance/chart/$activeName.SA?interval=$interval&period1=$period1&period2=$period2';
}

List<DateTime> calcularDatas() {
  final List<DateTime> datas = [];
  final DateTime dataAtual = DateTime.now();

  DateTime data;

  data = dataAtual.subtract(const Duration(days: 1));

  while (datas.length < 22) {
    // Verifica se o dia da semana não é sábado (6) nem domingo (7).
    if (data.weekday != 6 && data.weekday != 7) {
      datas.add(data);
    }

    // Avança para o próximo dia.
    data = data.subtract(const Duration(days: 1));
  }

  return datas;
}
