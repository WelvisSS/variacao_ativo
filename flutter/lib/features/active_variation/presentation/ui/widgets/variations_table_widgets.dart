import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

class TableWidget extends StatelessWidget {
  final List<double?> prices;
  final List<String> datas;

  const TableWidget({
    Key? key,
    required this.prices,
    required this.datas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> d1 = ["-"];
    List<String> d2 = ["-"];
    // Calcula a variação do preço comparando com o dia anterior e primeiro dia
    for (int i = 1; i < prices.length; i++) {
      d1.add((prices[i]! - prices[i - 1]!).toStringAsFixed(2));
      d2.add((prices[i]! - prices[0]!).toStringAsFixed(2));
    }

    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => ColorsApp.i.secundary,
            ),
            columns: const [
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
              for (var entry in prices.asMap().entries)
                DataRow(cells: [
                  DataCell(Text(
                    datas[entry.key],
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  )),
                  DataCell(Text(
                    "R\$ ${entry.value}",
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  )),
                  DataCell(Text(
                    d1[entry.key] == "-" ? d1[entry.key] : "${d1[entry.key]}%",
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  )),
                  DataCell(Text(
                    d2[entry.key] == "-" ? d2[entry.key] : "${d2[entry.key]}%",
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  )),
                ]),
              // Adicione mais linhas conforme necessário
            ],
          ),
        ],
      ),
    );
  }
}
