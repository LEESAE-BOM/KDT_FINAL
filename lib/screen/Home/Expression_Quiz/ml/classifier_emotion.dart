import 'dart:io';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MLService {
  Dio dio = Dio();

  // ml server
  Future<String?> convertEmotionImage (String image) async {
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.maxRedirects.isFinite;

      var bytes = File(image).readAsBytesSync();
      var encodedData = await compute(base64Encode, bytes);
      var formData = FormData.fromMap({'image': encodedData});

      Response response = await dio.post(
          'http:///v1/image/classifymodel',
          data: formData
      );
      print('성공적으로 업로드했습니다');
      String result = response.data;

      return result;

    } catch (e) {
      print(e);
      print('error?');
      return null;
    }
  }
  Future<String?> convertdeepfake (String image) async {
    try {
      dio.options.contentType = 'multipart/form-data';
      dio.options.maxRedirects.isFinite;

      var bytes = File(image).readAsBytesSync();
      var encodedData = await compute(base64Encode, bytes);
      var formData = FormData.fromMap({'image': encodedData});

      Response response = await dio.post(
          'http:///v1/image/makeimage',
          data: formData
      );
      print('성공적으로 업로드했습니다');
      String result = response.data['data'];

      return result;

    } catch (e) {
      print(e);
      print('error?');
      return null;
    }
  }
}

