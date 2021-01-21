import 'package:http/http.dart';
import 'dart:async';

class API {
    static Future<http.Response> getProducts() async {
        var result =
        await http.get("https://6008facd0a54690017fc27e7.mockapi.io/products");
        
        if (result.statusCode == 200) {
            return result;
        }
        else {
            return null;
        }
        
    }
}