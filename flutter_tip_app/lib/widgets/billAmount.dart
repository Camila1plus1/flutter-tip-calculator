import 'package:flutter/material.dart';

class BillAmount extends StatelessWidget {
  const BillAmount({
    super.key, required this.onChanged, required this.billAmount,
  });

  final String billAmount;
  // This widget is used to input the bill amount
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefix: Icon(Icons.attach_money),
        labelText: 'Bill Amount'),
      keyboardType: TextInputType.number,
      onChanged:(String value) {
          onChanged(value);
      },
    );
  }
}
