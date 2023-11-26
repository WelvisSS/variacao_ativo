import 'indicators_entity.dart';
import 'meta_entity.dart';

class ResultEntity {
  MetaEntity meta;
  List<int?> timestamp;
  IndicatorsEntity indicators;

  ResultEntity({
    required this.meta,
    required this.timestamp,
    required this.indicators,
  });

  String timestampToDate(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return '${date.day}/${date.month}';
  }
}
