import 'package:flutter/material.dart';

class totalPerPerson extends StatelessWidget {
  const totalPerPerson({
    super.key,
    required this.theme,
    required this.style,
    required this.total,
  });

  final ThemeData theme;
  final TextStyle style;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.all(8),
    child: Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.colorScheme.inversePrimary,
      borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          Text('Total tip per Person',
          style: style,
          ),
      Text('\$${total.toStringAsFixed(2)}',
      style: style.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: theme.textTheme.displaySmall!.fontSize,
          ),
         ),
       ],
     ),
    ),
    );
  }
}