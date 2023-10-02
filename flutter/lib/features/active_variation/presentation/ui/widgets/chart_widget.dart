import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatelessWidget {
  final List<double?> values;
  const LineChartWidget({
    Key? key,
    required this.values,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculando a rentabilidade dos pregões
    double calcularSoma(List<double?> lista) {
      double soma = 0;
      for (double? elemento in lista) {
        if (elemento != null) {
          soma += elemento;
        }
      }
      return double.parse(soma.toStringAsFixed(2));
    }

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height > 700 ? 300 : 200,
          child: SfCartesianChart(
            primaryXAxis: CategoryAxis(title: AxisTitle(text: 'Dias Corridos')),
            primaryYAxis: NumericAxis(title: AxisTitle(text: 'Variação em %')),
            series: <ChartSeries>[
              LineSeries<_ChartData, String>(
                dataSource: _getChartData(values.length, values),
                xValueMapper: (_ChartData data, _) => data.day,
                yValueMapper: (_ChartData data, _) => data.value,
                markerSettings: const MarkerSettings(isVisible: true),
                dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Row(
            children: [
              const Text(
                "Rentabilidade: ",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "${calcularSoma(values) > 0 ? "+" : ""}${calcularSoma(values)}%",
                style: TextStyle(
                  color: calcularSoma(values) > 0 ? Colors.green : Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Responsável pela montagem/marcação das posições do gráfico
class _ChartData {
  final String day;
  final double value;

  _ChartData(this.day, this.value);
}

List<_ChartData> _getChartData(int days, List<double?> values) {
  final List<_ChartData> chartData = [];

  for (int i = 1; i <= days; i++) {
    chartData.add(_ChartData('$i', values[i - 1] ?? 1));
  }

  return chartData;
}
