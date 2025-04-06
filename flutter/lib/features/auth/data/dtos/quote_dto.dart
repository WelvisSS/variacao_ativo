import '../../domain/entities/quote_entity.dart';

extension QuoteDto on QuoteEntity {
  static QuoteEntity fromJson(Map<String, dynamic> json) => QuoteEntity(
        low: List<double?>.from(json["low"].map((x) => x?.toDouble())),
        volume: List<int?>.from(json["volume"].map((x) => x)),
        close: List<double?>.from(json["close"].map((x) => x?.toDouble())),
        open: List<double?>.from(json["open"].map((x) => x?.toDouble())),
        high: List<double?>.from(json["high"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "low": List<dynamic>.from(low.map((x) => x)),
        "volume": List<dynamic>.from(volume.map((x) => x)),
        "close": List<dynamic>.from(close.map((x) => x)),
        "open": List<dynamic>.from(open.map((x) => x)),
        "high": List<dynamic>.from(high.map((x) => x)),
      };
}
