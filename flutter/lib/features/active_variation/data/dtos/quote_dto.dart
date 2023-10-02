import '../../domain/entities/quote_entity.dart';

extension QuoteDto on QuoteEntity {
  static QuoteEntity fromJson(Map<String, dynamic> json) => QuoteEntity(
        open: List<double?>.from(json["open"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "open": List<dynamic>.from(open.map((x) => x)),
      };
}
