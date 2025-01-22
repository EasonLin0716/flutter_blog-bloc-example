import 'package:json_annotation/json_annotation.dart';
import 'package:blog_repository/blog_repository.dart' hide Comment;
import 'package:blog_repository/blog_repository.dart'
    as blog_repository;

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  const Comment({
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  factory Comment.fromRepository(blog_repository.Comment comment) {
    return Comment(
      id: comment.id,
      name: comment.name,
      email: comment.email,
      body: comment.body
    );
  }
  
  static const Empty = Comment(id: 0, name: '', email: '', body: '');

  Map<String, dynamic> toJson() => _$CommentToJson(this);

  final int id;
  final String name;
  final String email;
  final String body;
  
}
