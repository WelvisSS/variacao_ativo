import 'indicators_entity.dart';
import 'meta_entity.dart';

class ResultEntity {
  MetaEntity meta;
  // List<int> timestamp;
  IndicatorsEntity indicators;

  ResultEntity({
    required this.meta,
    // required this.timestamp,
    required this.indicators,
  });
}
