import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  static String rootAuthority = "ws.audioscrobbler.com";
  static String version = "/2.0/";
  static String apiKey = "4d32e56090fceae682d8f0321c3acab7";

  static Future<List<dynamic>> getTop(String method, String object, String obj) async {
    Map<String, dynamic> queryParam = {
      "limit": "10",
      "method": method,
      "api_key": apiKey,
      "format": "json"
    };
    try {
      var res = await http.get(Uri.http(rootAuthority, version, queryParam));
      if (res.statusCode == 200) {
        print(jsonDecode(res.body)[object][obj]);
        return jsonDecode(res.body)[object][obj];
      } else if (res.statusCode == 400) {
        print(jsonDecode(res.body));
        Map<String, dynamic> map = jsonDecode(res.body);
        return Future.error(map.toString());
      } else {
        return Future.error("server error");
      }
    } catch (err) {
      return Future.error(err);
    }
  }

  static Future<Map<String, dynamic>> search(
      Map<String, dynamic> queryPram) async {
    queryPram.addAll({"api_key": apiKey, "format": "json"});
    try {
      var res = await http.get(Uri.http("ws.audioscrobbler.com", "/2.0/",
          queryPram)); //"$rootUrl?method=album.search&album=believe&format=json&limit=20&page=1&api_key=$apiKey"
      if (res.statusCode == 200) {
        print(json.decode(res.body)["results"]);
        return json.decode(res.body)["results"];
      } else if (res.statusCode == 400) {
        print(jsonDecode(res.body));
        Map<String, dynamic> map = jsonDecode(res.body);
        return map;
      } else {
        return Future.error("server error");
      }
    } catch (err) {
      return Future.error(err);
    }
  }
}

class ApiResponse {}

class ErrorMessage {
  String message;
  int error;

  ErrorMessage(this.message, this.error);
}
