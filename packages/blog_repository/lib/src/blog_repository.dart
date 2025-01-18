import 'dart:async';

import 'package:json_placeholder_api/json_placeholder_api.dart' hide Post;
import 'package:blog_repository/blog_repository.dart';

class BlogRepository {
  BlogRepository({JsonPlaceholderApiClient? jsonPlaceholderApiClient})
      : _jsonPlaceholderApiClient =
            jsonPlaceholderApiClient ?? JsonPlaceholderApiClient();

  final JsonPlaceholderApiClient _jsonPlaceholderApiClient;
  String _getUserNameByUserId(int userId, List<User> users) {
    final user = users.firstWhere((user) => user.id == userId);
    return user.username;
  }

  List<Post> _posts = [];
  List<Post> _getFilteredPosts(String keyword) {
    return _posts
        .where((post) =>
            post.title.toLowerCase().contains(keyword.toLowerCase()) ||
            post.body.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
  }

  Future<List<Post>> getPosts(String? keyword) async {
    if (_posts.isEmpty) {
      final postsData = await _jsonPlaceholderApiClient.getPosts();
      final usersData = await _jsonPlaceholderApiClient.getUsers();
      _posts = postsData
          .map((post) => Post(
              id: post.id,
              title: post.title,
              body: post.body,
              username: _getUserNameByUserId(post.userId, usersData)))
          .toList();
    }
    return _getFilteredPosts(keyword ?? '');
  }
}
