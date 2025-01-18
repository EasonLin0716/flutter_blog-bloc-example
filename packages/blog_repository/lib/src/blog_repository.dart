import 'dart:async';

import 'package:json_placeholder_api/json_placeholder_api.dart' hide Post;
import 'package:blog_repository/blog_repository.dart';

class BlogRepository {
  BlogRepository({JsonPlaceholderApiClient? jsonPlaceholderApiClient})
      : _jsonPlaceholderApiClient = jsonPlaceholderApiClient ??
            JsonPlaceholderApiClient();

  final JsonPlaceholderApiClient _jsonPlaceholderApiClient;

  Future<List<Post>> getPosts() async {
    String _getUserNameByUserId(int userId, List<User> users) {
      final user = users.firstWhere((user) => user.id == userId);
      return user.username;
    }
    final posts = await _jsonPlaceholderApiClient.getPosts();
    final users = await _jsonPlaceholderApiClient.getUsers();
    return posts.map((post) => Post(id: post.id, title: post.title, body: post.body, username: _getUserNameByUserId(post.userId, users))).toList();
  }
}