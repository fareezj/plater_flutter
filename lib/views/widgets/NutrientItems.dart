import 'package:flutter/material.dart';

class NutrientItems extends StatefulWidget {
  final String nutLabel;
  final double nutTotal;
  final String nutUnit;

  NutrientItems({this.nutLabel, this.nutTotal, this.nutUnit});

  @override
  _NutrientItemsState createState() => _NutrientItemsState();
}

class _NutrientItemsState extends State<NutrientItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          Text(
            widget.nutLabel,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            widget.nutTotal.toStringAsFixed(1),
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            widget.nutUnit,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
