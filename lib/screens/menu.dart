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
                    itemBuilder: (BuildContext context, int index){
                        return Card(
                            child: ListTile(
                                leading: Container(
                                    width:36,
                                    height:36,
                                    child: Placeholder(),
                                ),//Container
                                title: Text("Название товара" + index.toString()),
                                subtitle: Text("Краткое описание"),
                                trailing: IconButton(
                                                    icon: Icon(Icons.add_shopping_cart),
                                                    onPressed: () {},
                                                ),//IconButton
                            ),//ListTitle
                        );//Card
                    },
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