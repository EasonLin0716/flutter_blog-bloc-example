import 'dart:async';

import 'package:json_placeholder_api/json_placeholder_api.dart' hide Post;
import 'package:blog_repository/blog_repository.dart';

class BlogRepository {
  BlogRepository({JsonPlaceholderApiClient? jsonPlaceholderApiClient})
      : _jsonPlaceholderApiClient = jsonPlaceholderApiClient ??
            JsonPlaceholderApiClient();

  final JsonPlaceholderApiClient _jsonPlaceholderApiClient;

  Future<List<Post>> getPosts() async {
    final posts = await _jsonPlaceholderApiClient.getPosts();
    return posts.map((post) => Post(id: post.id, title: post.title, body: post.body, userId: post.userId)).toList();
  }
}