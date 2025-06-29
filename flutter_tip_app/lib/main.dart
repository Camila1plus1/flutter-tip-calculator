import 'package:flutter/material.dart';
import 'package:flutter_tip_app/widgets/person_counter.dart';
import 'package:flutter_tip_app/widgets/SamSlider.dart';
import 'package:flutter_tip_app/widgets/billAmount.dart';
import 'package:flutter_tip_app/widgets/totalPerPerson.dart';
import 'package:flutter_tip_app/widgets/tipRow.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int _personCount = 1;
  double _totalBill = 0.0;
  double _tipPercentage = 0.0;

  double billPerPerson(){
return (((_totalBill * _tipPercentage) + _totalBill)/_personCount);
  }

  double totalTip(){
    return _totalBill * _tipPercentage;
  }

  //Methods for decrementing and incrementing the person count
  void decrementPersonCount(){
    setState(() {
      if (_personCount > 1) {
        _personCount--;
      }
    });
  }

  void incrementPersonCount(){
    setState((){
      _personCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    double total = billPerPerson();
    double totalTips = totalTip();
    //Style for the text in the tip calculator
    final style = theme.textTheme.titleMedium!.copyWith(
    color: theme.colorScheme.onPrimary,
    fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('UTip App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          totalPerPerson(theme: theme, style: style, total: total),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: theme.colorScheme.primary),
              ),
              child: Column(
                children: [
                  BillAmount(
                    billAmount: '$_totalBill',
                    onChanged: (value){
                      setState((){
                        _totalBill = double.tryParse(value) ?? 0.0;
                      });
                      print('Bill Amount: $value');
                    }
                  ), 
                  //Section with Splitting the bill and incrementing/decrementing the person count
                  PersonCounter(theme: theme, personCount: _personCount, onDecrement: decrementPersonCount, onIncrement: incrementPersonCount,),
                  //Section with the tip percentage
                  TipRow(theme: theme, totalTips: totalTips),
                  //Slider text for tip percentage
                  Text(
                    '${(_tipPercentage * 100).round()} %'),
                  //Sam slider for tip percentage
                  SliderBar(tipPercentage: _tipPercentage, onChanged: (double value){
                    setState((){
                      _tipPercentage = value;
                    });
                  })
                ],
              ),
         ),
       ),
     ],
    ),
  );
 }
}

