import 'package:flutter/material.dart';
import 'package:flutter_app1/models/productModel.dart';

class DetailScreen extends StatefulWidget {
  final ProductModel model;
  DetailScreen(this.model) : super();

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.title),
      ),
      body: Column(
        children: [
          Placeholder(fallbackHeight: 300),
          Text(widget.model.title),
          Text(widget.model.subtitle)
        ],
      ),
    );
  }
}
