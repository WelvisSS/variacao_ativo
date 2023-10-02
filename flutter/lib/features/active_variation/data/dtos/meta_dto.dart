import '../../domain/entities/meta_entity.dart';

extension MetaDto on MetaEntity {
  static MetaEntity fromJson(Map<String, dynamic> json) => MetaEntity(
        regularMarketPrice: json["regularMarketPrice"]?.toDouble(),
        chartPreviousClose: json["chartPreviousClose"]?.toDouble(),
        previousClose: json["previousClose"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "regularMarketPrice": regularMarketPrice,
        "chartPreviousClose": chartPreviousClose,
        "previousClose": previousClose,
      };
}
