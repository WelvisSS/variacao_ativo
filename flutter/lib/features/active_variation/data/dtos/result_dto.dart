import '../../domain/entities/result_entity.dart';
import 'indicators_dto.dart';
import 'meta_dto.dart';

extension ResultDto on ResultEntity {
  static ResultEntity fromJson(Map<String, dynamic> json) => ResultEntity(
        meta: MetaDto.fromJson(json["meta"]),
        indicators: IndicatorsDto.fromJson(json["indicators"]),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "indicators": indicators.toJson(),
      };
}
