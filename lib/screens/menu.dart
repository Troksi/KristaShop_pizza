import 'package:flutter/material.dart';

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
            future: DataDumper.getProductsOnline(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                    _onWidgetDidBuild(() {
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('${snapshot.error}'),
                        backgroundColor: Colors.red,
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