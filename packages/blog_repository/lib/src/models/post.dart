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
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  final int id;
  final String title;
  final String body;
  final String username;

  @override
  List<Object> get props => [id, title, body, username];

  String get formattedTitle {
    if (title.length > 50) {
      return '${title.substring(0, 50)}...';
    }
    return title;
  }

  String get formattedBody {
    if (body.length > 100) {
      return '${body.substring(0, 100)}...';
    }
    return body;
  }
}
