import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class ServiceHttp{
  

    // ! GET
  static  Future<Response> getHttpResponse({required String uri,dynamic header}) async{
      var client = http.Client();
      var reponse = await client.get(Uri.parse(uri),headers: header);
      return reponse;
    }
    // ! POST
  static  Future<Response> psttHttpResponse({required String uri,dynamic header,dynamic body}) async{
      var client = http.Client();
      var reponse = await client.post(Uri.parse(uri),headers: header,body: body);
      return reponse;
    }
}