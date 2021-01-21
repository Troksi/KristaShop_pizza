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
          body: GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: 4,
                    itemBuilder: (ctx, i) => Container(child: Placeholder(), ),
                    //gridDelegate: SliverGridDelegateWithCrossAxisCount(
                        //crossAxisCount: 2,
                       // childAspectRatio: 3/2,
                      //  crossAxisSpacing: 10,
                    //    mainAxisSpacing: 10,
                   // ),
                )
        );
  }
}