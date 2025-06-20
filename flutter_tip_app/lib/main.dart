import 'package:flutter/material.dart';
import 'package:flutter_tip_app/widgets/person_counter.dart';
import 'package:flutter_tip_app/widgets/SamSlider.dart';

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
  
  double _tipPercentage = 0.0;
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
          Padding(
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
            Text('\$15.00',
            style: style.copyWith(
              color: theme.colorScheme.onPrimary,
              fontSize: theme.textTheme.displaySmall!.fontSize,
                ),
               ),
             ],
           ),
         ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: theme.colorScheme.primary),
              ),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.attach_money),
                      labelText: 'Bill Amount'),
                    keyboardType: TextInputType.number,
                    onChanged:(value) {
                       print('Value: $value'); 
                    },
                  ), 
                  //Section with Splitting the bill and incrementing/decrementing the person count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( 'Split',
                      style: theme.textTheme.titleMedium),
                      PersonCounter(theme: theme, personCount: _personCount, onDecrement: decrementPersonCount, onIncrement: incrementPersonCount,),
                    ],
                  ),
                  //Section with the tip percentage
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tip',
                      style: theme.textTheme.titleMedium),
                      Text('\$15', 
                      style: theme.textTheme.titleMedium)
                    ],
                  ),
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
