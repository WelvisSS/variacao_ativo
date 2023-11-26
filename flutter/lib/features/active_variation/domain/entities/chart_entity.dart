import 'result_entity.dart';

class ChartEntity {
  List<ResultEntity> result;
  dynamic error;

  ChartEntity({
    required this.result,
    required this.error,
  });
}
