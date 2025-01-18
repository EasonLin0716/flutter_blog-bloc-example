import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_placeholder_api/json_placeholder_api.dart';

class JsonPlaceholderApiClient {
  JsonPlaceholderApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'jsonplaceholder.typicode.com';
  final http.Client _httpClient;

  /// Gets a list of [Post] /posts`
  Future<List<Post>> getPosts() async {
    final postRequest = Uri.https(_baseUrl, '/posts');

    final postResponse = await _httpClient.get(postRequest);

    if (postResponse.statusCode != 200) {
      throw Exception();
    }

    final postJson = jsonDecode(postResponse.body) as List;
    return postJson.map((json) => Post.fromJson(json)).toList();
  }
}
