import 'result_dto.dart';
import '../../domain/entities/chart_entity.dart';
import '../../domain/entities/result_entity.dart';

extension ChartDto on ChartEntity {
  static ChartEntity fromJson(Map<String, dynamic> json) {
    return ChartEntity(
      result: List<ResultEntity>.from(json["result"].map(
        (x) => ResultDto.fromJson(x),
      )),
    );
  }

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}
