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
  List<ProductModel> _products = List<ProductModel>();
  
   @override
  void initState() {
    _products = DataPreLoader.getProducts();
    DataDumper.getProductsOnline();

    super.initState();
  }

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


 void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

makeList(){
    return ListView.builder(
        itemCount: _products.length,
        itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
                    leading: Container(
                        width: 36,
                        height: 36,                            
                        child: Image.network(
                            _products.elementAt(index).imgUrl,
                            fit: BoxFit.cover,
                        ),
                    ),
                    title: Text(_products.elementAt(index).title),
                    subtitle: Text(_products.elementAt(index).subtitle),
                    trailing: IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        tooltip: 'Добавить товар в корзину',

                        onPressed: () {
                            setState(() {
                                DataPreLoader.addCart(_products.elementAt(index));
                            });                                
                        },
                        ),
                    onTap: () {
                        Navigator.push(
                            context, 
                            CupertinoPageRoute(builder: (_) => 
                            Product(model: _products.elementAt(index))));
                    },
                ),
                
            );
        },
    );
  }
}