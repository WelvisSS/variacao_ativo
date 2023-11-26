import '../../domain/entities/result_entity.dart';
import 'indicators_dto.dart';
import 'meta_dto.dart';

extension ResultDto on ResultEntity {
  static ResultEntity fromJson(Map<String, dynamic> json) => ResultEntity(
        meta: MetaDto.fromJson(json["meta"]),
        timestamp: List<int>.from(json["timestamp"].map((x) => x)),
        indicators: IndicatorsDto.fromJson(json["indicators"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "timestamp": List<dynamic>.from(timestamp.map((x) => x)),
        "indicators": indicators.toJson(),
      };
}
