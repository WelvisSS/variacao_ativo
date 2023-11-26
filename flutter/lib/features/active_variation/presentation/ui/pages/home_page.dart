import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../domain/entities/finances_entity.dart';
import '../../controllers/active_variation.dart';
import '../widgets/chart_widget.dart';
import '../widgets/select_active_widget.dart';
import '../widgets/variations_table_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ActiveVariationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<ActiveVariationController>();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 45,
          bottom: 0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              ColorsApp.i.backgroundColor,
              ColorsApp.i.backgroundColor,
              Colors.black,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder<FinancesEntity?>(
                    valueListenable: _controller.financesInfo,
                    builder: (_, finances, __) {
                      return finances != null
                          ? Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Row(
                                children: [
                                  // const Text("Ativo: "),
                                  Text(
                                    finances.chart.result[0].meta.symbol!
                                        .split(".")[0],
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: size.height * .1,
                              child: const Center(
                                child:
                                    CircularProgressIndicator(), // Aqui está o indicador de carregamento
                              ),
                            );
                    }),
                Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: SelectActiveWidget(
                      changeActive: _controller.changeActive),
                ),
              ],
            ),
            ValueListenableBuilder<FinancesEntity?>(
              valueListenable: _controller.financesInfo,
              builder: (_, finances, __) {
                return finances != null
                    ? Column(
                        children: [
                          SizedBox(
                            height: size.height * .4,
                            child: LineChartWidget(
                              quote:
                                  finances.chart.result[0].indicators.quote[0],
                              timestamps: finances.chart.result[0].timestamp,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(
                        height: size.height * .4,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ), // Aqui está o indicador de carregamento
                        ),
                      );
              },
            ),
            ValueListenableBuilder<FinancesEntity?>(
              valueListenable: _controller.financesInfo,
              builder: (_, finances, __) {
                return finances != null
                    ? TableWidget(
                        closePrices:
                            finances.chart.result[0].indicators.quote[0].close,
                        timestramps: finances.chart.result[0].timestamp)
                    : SizedBox(
                        height: size.height * .4,
                        child: const Center(
                          child:
                              CircularProgressIndicator(), // Aqui está o indicador de carregamento
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
