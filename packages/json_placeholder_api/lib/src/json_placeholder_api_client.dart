import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_placeholder_api/json_placeholder_api.dart';
import 'package:json_placeholder_api/src/models/user.dart';

/// Exception thrown when fetching posts fails
class PostsFetchFailureException implements Exception {}

/// Exception thrown when fetching users fails
class UsersFetchFailureException implements Exception {}

class JsonPlaceholderApiClient {
  JsonPlaceholderApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'jsonplaceholder.typicode.com';
  final http.Client _httpClient;

  /// Gets a list of [Post] /posts
  Future<List<Post>> getPosts() async {
    final postRequest = Uri.https(_baseUrl, '/posts');

    final postResponse = await _httpClient.get(postRequest);

    if (postResponse.statusCode != 200) {
      throw PostsFetchFailureException();
    }

    final postJson = jsonDecode(postResponse.body) as List;
    return postJson.map((json) => Post.fromJson(json)).toList();
  }


  /// Get a [Post] by [id] /posts/:id
  Future<Post> getPost(int id) async {
    final postRequest = Uri.https(_baseUrl, '/posts/$id');

    final postResponse = await _httpClient.get(postRequest);

    if (postResponse.statusCode != 200) {
      throw PostsFetchFailureException();
    }

    final postJson = jsonDecode(postResponse.body);
    return Post.fromJson(postJson);
  }

  /// Gets a list of [User] /users
  Future<List<User>> getUsers() async {
    final userRequest = Uri.https(_baseUrl, '/users');

    final userResponse = await _httpClient.get(userRequest);

    if (userResponse.statusCode != 200) {
      throw UsersFetchFailureException();
    }

    final userJson = jsonDecode(userResponse.body) as List;
    return userJson.map((json) => User.fromJson(json)).toList();
  }

  Future<User> getUser(int id) async {
    final userRequest = Uri.https(_baseUrl, '/users/$id');

    final userResponse = await _httpClient.get(userRequest);

    if (userResponse.statusCode != 200) {
      throw UsersFetchFailureException();
    }

    final userJson = jsonDecode(userResponse.body);
    return User.fromJson(userJson);
  }
}
