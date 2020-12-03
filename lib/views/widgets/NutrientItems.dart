import 'package:flutter/material.dart';

class NutrientItems extends StatefulWidget {

  final String nutLabel;
  final String nutTotal;
  final String nutUnit;

  NutrientItems({this.nutLabel, this.nutTotal, this.nutUnit});

  @override
  _NutrientItemsState createState() => _NutrientItemsState();
}

class _NutrientItemsState extends State<NutrientItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(40.0)
      ),
      child: Column(
        children: [
          Text(widget.nutLabel),
          Text(widget.nutTotal),
          Text(widget.nutUnit),
        ],
      ),
    );
  }
}
