class MetaEntity {
  double regularMarketPrice;
  double chartPreviousClose;
  double previousClose;

  MetaEntity({
    required this.regularMarketPrice,
    required this.chartPreviousClose,
    required this.previousClose,
  });

  factory MetaEntity.fromJson(Map<String, dynamic> json) => MetaEntity(
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
