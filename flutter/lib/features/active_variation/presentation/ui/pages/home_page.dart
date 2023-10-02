import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(
          left: 3,
          right: 3,
          top: 45,
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder<String?>(
                    valueListenable: _controller.selectedActive,
                    builder: (_, activeName, __) {
                      return activeName != null
                          ? Container(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Row(
                                children: [
                                  // const Text("Ativo: "),
                                  Text(
                                    activeName,
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
            ValueListenableBuilder<List<double?>?>(
                valueListenable: _controller.finances,
                builder: (_, open, __) {
                  return open != null
                      ? Column(
                          children: [
                            SizedBox(
                              height: size.height * .4,
                              child: LineChartWidget(values: open),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: size.height * .4,
                          child: const Center(
                            child:
                                CircularProgressIndicator(), // Aqui está o indicador de carregamento
                          ),
                        );
                }),
            ValueListenableBuilder<List<double?>?>(
                valueListenable: _controller.prices,
                builder: (_, prices, __) {
                  return prices != null
                      ? TableWidget(prices: prices, datas: _controller.datas)
                      : SizedBox(
                          height: size.height * .4,
                          child: const Center(
                            child:
                                CircularProgressIndicator(), // Aqui está o indicador de carregamento
                          ),
                        );
                }),
          ],
        ),
      ),
    );
  }
}
