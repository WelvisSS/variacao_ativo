import 'package:flutter/material.dart';
import 'package:mrx_charts/mrx_charts.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../domain/entities/quote_entity.dart';

class LineChartWidget extends StatelessWidget {
  final List<int?> timestamps;
  final QuoteEntity quote;
  const LineChartWidget({
    Key? key,
    required this.quote,
    required this.timestamps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String timestampToDate(int timestamp) {
      var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
      return '${date.day}/${date.month}';
    }

    return Chart(
      layers: [
        ChartGridLayer(
          settings: ChartGridSettings(
            x: ChartGridSettingsAxis(
              color: Colors.white.withOpacity(0.2),
              frequency: 3,
              max: 30,
              min: 0,
            ),
            y: ChartGridSettingsAxis(
              color: Colors.white.withOpacity(0.2),
              frequency: (quote.maxValue! - quote.minValue!) / 3,
              max: quote.maxValue!,
              min: quote.minValue!,
            ),
          ),
        ),
        ChartAxisLayer(
          settings: ChartAxisSettings(
            x: ChartAxisSettingsAxis(
              frequency: 3,
              max: 29,
              min: 0,
              textStyle: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 10.0,
              ),
            ),
            y: ChartAxisSettingsAxis(
              frequency: (quote.maxValue! - quote.minValue!) / 3,
              max: quote.maxValue!,
              min: quote.minValue!,
              textStyle: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 10.0,
              ),
            ),
          ),
          labelX: (value) => timestampToDate(timestamps[value.toInt()]!),
          labelY: (value) => value.toInt().toString(),
        ),
        ChartCandleLayer(
          items: [
            for (int i = 0; i < quote.close.length; i++)
              ChartCandleDataItem(
                color: quote.close[i]! >= quote.open[i]!
                    ? ColorsApp.i.candlePositiveColor
                    : ColorsApp.i.candleNegativeColor,
                value1: ChartCandleDataItemValue(
                  max: quote.open[i]!,
                  min: quote.close[i]!,
                ),
                value2: ChartCandleDataItemValue(
                  max: quote.high[i]!,
                  min: quote.low[i]!,
                ),
                x: i.toDouble(),
              )
          ],
          settings: const ChartCandleSettings(),
        )
      ],
    );
  }
}
