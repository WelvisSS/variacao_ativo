import 'package:flutter/material.dart';
import '../../../../../core/utils/actives_list.utils.dart';

class SelectActiveWidget extends StatefulWidget {
  final Function changeActive;
  const SelectActiveWidget({
    Key? key,
    required this.changeActive,
  }) : super(key: key);

  @override
  SelectActiveWidgetState createState() => SelectActiveWidgetState();
}

class SelectActiveWidgetState extends State<SelectActiveWidget> {
  String selectedAsset = 'PETR4';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton<String>(
            value: selectedAsset,
            onChanged: (String? newValue) {
              setState(() {
                selectedAsset = newValue!;
              });
            },
            items: actives.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(width: 5.0),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2C77BB),
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: const EdgeInsets.only(left: 10),
            height: 40,
            child: IconButton(
              onPressed: () {
                widget.changeActive(activeName: selectedAsset);
              },
              icon: const Icon(Icons.search_rounded),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
