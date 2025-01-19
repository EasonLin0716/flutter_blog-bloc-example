part of 'post_cubit.dart';

@JsonSerializable()
class PostState extends Equatable {
  const PostState({
    this.posts = const [],
  });

  final List<Post> posts;

  PostState copyWith({
    List<Post>? posts,
  }) {
    return PostState(
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object?> get props => [posts];
}
