import 'package:flutter/material.dart';

class IngredientItems extends StatefulWidget {
  final String ingItem;
  final double ingWeight;
  final String ingImage;

  IngredientItems({this.ingItem, this.ingWeight, this.ingImage});

  @override
  _IngredientItemsState createState() => _IngredientItemsState();
}

class _IngredientItemsState extends State<IngredientItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.0),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 200.0,
            child: Text(
              widget.ingItem,
              maxLines: 3,
            ),
          ),
          Text(widget.ingWeight.toStringAsFixed(1) + 'g'),
          Container(
              width: 50.0, height: 50.0, child: Image.network(widget.ingImage))
        ],
      ),
    );
  }
}
