import 'package:flutter/material.dart';

class CustomQuoteListWidget extends StatelessWidget {
  final List<double?> open;
  const CustomQuoteListWidget({
    Key? key,
    required this.open,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      color: Colors.green,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: open.length,
        itemBuilder: (_, idx) {
          return Column(
            children: [
              Text((open[idx] ?? "-").toString()),
            ],
          );
        },
      ),
    );
  }
}
