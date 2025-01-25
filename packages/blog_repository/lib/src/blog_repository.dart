import 'dart:async';

import 'package:blog_repository/src/models/comment.dart';
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

  String _getUserAvatarByUserId(int userId, List<User> users) {
    final user = users.firstWhere((user) => user.id == userId);
    return user.avatar;
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
      postsData.shuffle();
      _posts = postsData
          .map((post) => Post(
              id: post.id,
              title: post.title,
              body: post.body,
              cover: post.cover,
              username: _getUserNameByUserId(post.userId, usersData),
              avatar: _getUserAvatarByUserId(post.userId, usersData)))
          .toList();
    }
    return _getFilteredPosts(keyword ?? '');
  }

  Future<Post> getPost(int id) async {
    final postData = await _jsonPlaceholderApiClient.getPost(id);
    final usersData = await _jsonPlaceholderApiClient.getUser(postData.userId);
    return Post(
        id: postData.id,
        title: postData.title,
        body: postData.body,
        username: usersData.username,
        avatar: usersData.avatar,
        cover: postData.cover);
  }

  Future<List<Comment>> getCommentsByPostId(int postId) async {
    final commentsData =
        await _jsonPlaceholderApiClient.getCommentsByPostId(postId);
    return commentsData
        .map((comment) => Comment(
            id: comment.id,
            name: comment.name,
            email: comment.email,
            body: comment.body))
        .toList();
  }
}
