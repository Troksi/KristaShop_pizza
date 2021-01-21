
class dataPreLoader{

}
import 'package:flutter/material.dart';
import 'package:pizza/models/productModel.dart';
import 'package:pizza/pages/API.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'dart:async';

class DataPreLoader{
    static List<ProductModel> _inCart = List<ProductModel>(); 

    static List<ProductModel> getProducts(){
        List<ProductModel> models = List<ProductModel>();

        models.add(ProductModel(
            "test 1", 
            "subtest 1", 
            10, 
            "https://mir-s3-cdn-cf.behance.net/project_modules/1400/a1dccf72245989.5be11d2f208ae.png"));
        models.add(ProductModel(
            "test 2", 
            "subtest 2", 
            20, 
            "https://mir-s3-cdn-cf.behance.net/project_modules/1400/a1dccf72245989.5be11d2f208ae.png"));
        models.add(ProductModel(
            "test 3", 
            "subtest 3", 
            30, 
            "https://mir-s3-cdn-cf.behance.net/project_modules/1400/a1dccf72245989.5be11d2f208ae.png"));
        
        return models;
    }

    static getProductsOnline() async {
        var data = await API.getProducts();

        if (data != null ) {
            List<dynamic> jsonData = jsonDecode(utf8.decode(data.bodyBytes));
            List<ProductModel> models = List<ProductModel>(); 
            jsonData.forEach((element) {
                models.add(ProductModel.fromJson(element));
            });
            return models;
        }
        else {
            return getProducts();
        }
    }

    static List<ProductModel> getCart() {
        return _inCart;
    }

    static addCart (ProductModel model) {
        _inCart.add(model);
    }

    static removeCart (ProductModel model) {
        _inCart.remove(model);
    } 

    static getCartPrice () {
        var cost = 0.0;
        _inCart.forEach((element) {
            cost += element.price;
        });
        return cost;
    }
}