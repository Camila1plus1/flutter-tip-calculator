import 'package:flutter/material.dart';

//Sam slider widget for the tip percentage
class SliderBar extends StatelessWidget {
  const SliderBar({
    super.key,
    required double tipPercentage, this.onChanged,
  }) : _tipPercentage = tipPercentage;

  final double _tipPercentage;
  final ValueChanged<double>? onChanged;  

  @override
  Widget build(BuildContext context) {
    return Slider(value: _tipPercentage,
    onChanged: onChanged,
    min: 0,
    max: 0.5,
    label: '${(_tipPercentage * 100).round()}%',
    divisions: 5,
    );
  }
}

