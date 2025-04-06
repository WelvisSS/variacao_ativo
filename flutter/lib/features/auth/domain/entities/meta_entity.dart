class MetaEntity {
  double? regularMarketPrice;
  double? chartPreviousClose;
  double? previousClose;
  String? symbol;

  MetaEntity({
    required this.regularMarketPrice,
    required this.chartPreviousClose,
    required this.previousClose,
    required this.symbol,
  });

  factory MetaEntity.fromJson(Map<String, dynamic> json) => MetaEntity(
        regularMarketPrice: json["regularMarketPrice"]?.toDouble(),
        chartPreviousClose: json["chartPreviousClose"]?.toDouble(),
        previousClose: json["previousClose"]?.toDouble(),
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "regularMarketPrice": regularMarketPrice,
        "chartPreviousClose": chartPreviousClose,
        "previousClose": previousClose,
        "symbol": symbol,
      };
}
