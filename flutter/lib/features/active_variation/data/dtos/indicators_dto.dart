import 'quote_dto.dart';
import '../../domain/entities/quote_entity.dart';
import '../../domain/entities/indicators_entity.dart';

extension IndicatorsDto on IndicatorsEntity {
  static IndicatorsEntity fromJson(Map<String, dynamic> json) =>
      IndicatorsEntity(
        quote: List<QuoteEntity>.from(
            json["quote"].map((x) => QuoteDto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "quote": List<dynamic>.from(quote.map((x) => x.toJson())),
      };
}
