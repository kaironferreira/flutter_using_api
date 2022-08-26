import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_using_api/models/Post.dart';
import 'package:http/http.dart' as http;

class PostController {
  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  callApi() async {
    var client = http.Client();
    try {
      isLoading.value = true;
      var response = await client.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );
      var decodedRsponse = jsonDecode(response.body) as List;
      posts.value = decodedRsponse.map((e) => Post.fromJson(e)).toList();
    } catch (e) {
      print(e);
    } finally {
      client.close();
      isLoading.value = false;
    }
  }
}
