import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class TableWidget extends StatelessWidget {
  final List<double?> closePrices;
  final List<int?> timestramps;

  const TableWidget({
    Key? key,
    required this.closePrices,
    required this.timestramps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> d1 = ["-"];
    List<String> d2 = ["-"];
    // Calcula a variação do preço comparando com o dia anterior e primeiro dia
    for (int i = 1; i < closePrices.length; i++) {
      d1.add((closePrices[i]! - closePrices[i - 1]!).toStringAsFixed(2));
      d2.add((closePrices[i]! - closePrices[0]!).toStringAsFixed(2));
    }

    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          DataTable(
            columnSpacing: 30,
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => ColorsApp.i.secundary,
            ),
            columns: const [
              DataColumn(
                  label: Text('Dia', style: TextStyle(color: Colors.white))),
              DataColumn(
                  label: Text('Data', style: TextStyle(color: Colors.white))),
              DataColumn(
                  label: Text('Valor', style: TextStyle(color: Colors.white))),
              DataColumn(
                  label: Text('D-1', style: TextStyle(color: Colors.white))),
              DataColumn(
                  label: Text('D-D1', style: TextStyle(color: Colors.white))),
            ],
            rows: [
              for (var entry in closePrices.asMap().entries)
                DataRow(cells: [
                  DataCell(
                    Text(
                      (entry.key + 1).toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  DataCell(
                    Text(
                      "${DateTime.fromMillisecondsSinceEpoch(timestramps[entry.key]! * 1000).day}/${DateTime.fromMillisecondsSinceEpoch(timestramps[entry.key]! * 1000).month}",
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  DataCell(
                    Text(
                      "R\$ ${entry.value!.toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                  DataCell(
                    Text(
                      d1[entry.key] == "-"
                          ? d1[entry.key]
                          : "${d1[entry.key]}%",
                      style: TextStyle(
                        fontSize: 12,
                        color: d1[entry.key].contains("-")
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      d2[entry.key] == "-"
                          ? d2[entry.key]
                          : "${d2[entry.key]}%",
                      style: TextStyle(
                        fontSize: 12,
                        color: d2[entry.key].contains("-")
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ),
                ]),
              // Adicione mais linhas conforme necessário
            ],
          ),
        ],
      ),
    );
  }
}
