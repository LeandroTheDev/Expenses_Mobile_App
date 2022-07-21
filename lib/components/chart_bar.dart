// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{

  final String label;
  final double value;
  final double percentage;

  ChartBar({Key? key, 
    required this.label,
    required this.value,
    required this.percentage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        height: 20,
        child: FittedBox(
          child: Text(value.toStringAsFixed(0))
        ),
      ),
      SizedBox(height: 5),
      SizedBox(
        height: 60,
        width: 10,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 1.0,
                ),
                color: Color.fromARGB(255, 10, 10, 10),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            FractionallySizedBox(
              heightFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 5),
      Text(label),  
    ],
  );
  }
}