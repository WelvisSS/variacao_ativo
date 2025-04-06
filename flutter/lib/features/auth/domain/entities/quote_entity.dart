class QuoteEntity {
  List<double?> low;
  List<int?> volume;
  List<double?> close;
  List<double?> open;
  List<double?> high;

  QuoteEntity({
    required this.low,
    required this.volume,
    required this.close,
    required this.open,
    required this.high,
  });

  double? get maxValue {
    return high
        .reduce((maxValue, value) => value! > maxValue! ? value : maxValue);
  }

  double? get minValue {
    return low
        .reduce((minValue, value) => value! < minValue! ? value : minValue);
  }
}
