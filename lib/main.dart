import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screen/cart.dart';
import 'package:getx/screen/get_api.dart';
import 'package:getx/screen/home.dart';
import 'package:getx/screen/post.dart';
import 'package:getx/screen/put.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Defining our MaterialApp in flutter using GetMaterialAppProperty
    return GetMaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': ((p0) => Home()),
      'cart': ((p0) => const Cart()),
      'getdata': ((p0) => const GetData()),
      'postdata': ((p0) => PostData()),
      'putdata': ((p0) => PutData())
    });
  }
}
