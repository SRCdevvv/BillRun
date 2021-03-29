import 'dart:async' show Future;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class ProductList {
  final List<Product> products;

  ProductList({
    this.products,
});

  factory ProductList.fromJson(List<dynamic> parsedJson){
    List<Product> products = new List<Product>();
    products = parsedJson.map((i) => Product.fromJson(i)).toList();

    return new ProductList(
      products: products
    );
  }
}

class Product{
  final int id;
  final String name;
  final String caution;

  Product({
    this.id,
    this.name,
    this.caution
});

  factory Product.fromJson(Map<String, dynamic> json){
    return new Product(
      id: json['id'],
      name: json['name'],
      caution: json['caution'],
    );
  }

}


Future loadProducts() async{
  var url = Uri.parse("http://ec2-35-175-245-21.compute-1.amazonaws.com:8000/api/product_list");
  var jsonProducts = await http.get(url);
  var dataConvertedToJSON = jsonDecode(utf8.decode(jsonProducts.bodyBytes));

  ProductList productList = ProductList.fromJson(dataConvertedToJSON);
  print("product"+productList.products[1].name);
}


void main(){
  print( loadProducts());
}




