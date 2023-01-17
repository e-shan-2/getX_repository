import 'dart:convert';
import 'package:getx/model/dataModel.dart';
import 'package:http/http.dart' as http;

class Apiservices {
  // using get result
  Future<List<DataModel>> getdata() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      if (response.statusCode == 200) {
        List res = jsonDecode(response.body);
        List<DataModel> listres =
            res.map((e) => DataModel.fromJson(e)).toList();

        return listres;
      } else {
        return Future.error(response.statusCode);
      }
    } catch (error) {
      return Future.error(error);
    }
  }

// using post request
  Future postdata(int id, String title, String body) async {
    try {
      final response = await http.post(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          body: jsonEncode({
           
            "id": id,
            "title": title,
            "body": body,
          }));

      if (response.statusCode == 201) {
        return response.statusCode;
      } else {
        Future.error(response.statusCode);
      }
    } catch (error) {
      return Future.error(error);
    }
  }

// for updating the result
  Future putdata(int id,  String title, String body) async {
    try {
      final response = await http.put(
          Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"),
          body: jsonEncode({
          
            "id": id,
            "title": title,
            "body": body,
          }));
      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        Future.error(response.statusCode);
      }
    } catch (error) {
      return Future.error(error);
    }
  }

// For deleting the request
  Future deleteData(int id) async {
    try {
      final response = await http
          .delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));

      if (response.statusCode == 200) {
        return response.statusCode;
      } else {
        Future.error(response.statusCode);
      }
    } catch (error) {
      return Future.error(error);
    }
  }
}
