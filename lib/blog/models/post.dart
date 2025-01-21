import 'package:json_annotation/json_annotation.dart';
import 'package:blog_repository/blog_repository.dart' hide Post;
import 'package:blog_repository/blog_repository.dart'
    as blog_repository;

part 'post.g.dart';


String _formatByMaxLength(String data, int maxLength) {
  if (data.length > maxLength) {
    return '${data.substring(0, maxLength)}...';
  }
  return data;
}

@JsonSerializable()
class Post {
  const Post({
    required this.id,
    required this.title,
    required this.body,
    required this.username,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  factory Post.fromRepository(blog_repository.Post post) {
    return Post(
      id: post.id,
      title: _formatByMaxLength(post.title, 50),
      body: _formatByMaxLength(post.body, 100),
      username: post.username,
    );
  }
  
  static const Empty = Post(id: 0, title: '', body: '', username: '');

  Map<String, dynamic> toJson() => _$PostToJson(this);

  final int id;
  final String title;
  final String body;
  final String username;
}
