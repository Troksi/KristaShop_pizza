import 'package:flutter/material.dart';
import 'package:pizza/screens/menu.dart';
import 'package:pizza/screens/cart.dart';
import 'package:pizza/screens/profile.dart';

void main() =>  runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var _currentIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: IndexedStack(
          index: _currentIndex,
          children: [Menu(),Cart(),Profile()],
          ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (selectedIndex){
              setState((){
                  _currentIndex = selectedIndex;
              });
          },
          currentIndex: _currentIndex,
          items:[
      BottomNavigationBarItem(icon:Icon(Icons.local_pizza),label: "Меню"),
      BottomNavigationBarItem(icon:Icon(Icons.shopping_cart),label: "Корзина"),
      BottomNavigationBarItem(icon:Icon(Icons.perm_identity),label: "Профиль"),
      ],
      ),
    );
  }
}
