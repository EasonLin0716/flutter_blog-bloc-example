import 'package:json_annotation/json_annotation.dart';
part 'comment.g.dart';

/**
 * comment response example
 * {
 *   "postId": 1,
 *   "id": 1,
 *   "name": "id labore ex et quam laborum",
 *   "email": "Eliseo@gardner.biz",
 *   "body": "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium"
 * }
 */
@JsonSerializable()
class Comment {
  const Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  // factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);


  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      body: json['body'] as String,
      email: json['email'] as String,
    );
  }
}