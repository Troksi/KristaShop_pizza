import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pizza/screens/product.dart';
import 'package:pizza/models/productModel.dart';
import 'package:pizza/screens/data.dart';


class Menu extends StatefulWidget {
    Menu({Key key}):super(key:key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Меню'),
          ),
          body:  FutureBuilder(
            future: DataPreLoader.getProductsOnline(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                    _onWidgetDidBuild(() {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('${snapshot.error}'),
                        backgroundColor: Colors.red[900],
                    ));
                    });
                }
                if (snapshot.hasData) {
                    _products = snapshot.data;
                    return makeList();
                }
                else {
                    return Center(
                        child: CircularProgressIndicator(), 
                    );
                }
            }, 
        ),
        );
  }
}