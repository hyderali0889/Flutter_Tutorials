import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  Future<dynamic> getAllProducts() async {
    try {
      Response data = await Dio().get("http://localhost:8000/products/api/v1");
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> deleteProducts(String id) async {
    try {
      await Dio().delete("http://localhost:8000/products/api/v1/$id");
    } catch (e) {
      print(e);
    }
  }

  addProducts(String title, String des, String price, File? file) async {
    try {
    
      FormData formdata = FormData.fromMap({
        "title": title,
        "description": des,
        "price": price,
        "file": await MultipartFile.fromFile(file!.path)
      });
      var res = await Dio()
          .post("http://localhost:8000/products/api/v1", data: formdata);
    } catch (e) {
      print("An Error $e");
    }
  }
}
