import '../../domain/entities/finances_entity.dart';
import 'chart_dto.dart';

extension FinancesDto on FinancesEntity {
  static FinancesEntity fromJson(Map<String, dynamic> json) =>
      FinancesEntity(chart: ChartDto.fromJson(json["chart"]));

  Map<String, dynamic> toJson() => {"chart": chart.toJson()};
}
