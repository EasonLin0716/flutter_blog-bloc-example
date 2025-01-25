import 'package:json_annotation/json_annotation.dart';
import 'package:blog_repository/blog_repository.dart' as blog_repository;

part 'post.g.dart';

String _formatByMaxLength(String data, int maxLength) {
  if (data.length > maxLength) {
    return '${data.substring(0, maxLength)}...';
  }
  return data;
}

@JsonSerializable()
class Post {
  static const int titleMaxLength = 32;
  static const int bodyMaxLength = 100;

  const Post({
    required this.id,
    required this.title,
    required this.body,
    required this.username,
    required this.avatar,
    required this.cover,
  });

  factory Post.forList(Post post) {
    return Post(
      id: post.id,
      title: _formatByMaxLength(post.title, titleMaxLength),
      body: _formatByMaxLength(post.body, bodyMaxLength),
      username: post.username,
      avatar: post.avatar,
      cover: post.cover,
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.fromRepository(blog_repository.Post post) {
    return Post(
      id: post.id,
      title: post.title,
      body: post.body,
      username: post.username,
      avatar: post.avatar,
      cover: post.cover,
    );
  }

  static const Empty =
      Post(id: 0, title: '', body: '', username: '', avatar: '', cover: '');

  Map<String, dynamic> toJson() => _$PostToJson(this);

  final int id;
  final String title;
  final String body;
  final String username;
  final String avatar;
  final String cover;
}
