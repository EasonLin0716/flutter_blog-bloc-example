import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends Equatable {
  const Post({
    required this.id,
    required this.title,
    required this.body,
    required this.username,
    required this.avatar,
    required this.cover,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  final int id;
  final String title;
  final String body;
  final String username;
  final String avatar;
  final String cover;

  @override
  List<Object> get props => [id, title, body, username, avatar, cover];
}
