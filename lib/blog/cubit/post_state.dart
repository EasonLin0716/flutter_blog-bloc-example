part of 'post_cubit.dart';

@JsonSerializable()
class PostState extends Equatable {
  const PostState({
    this.posts = const [],
    this.postDetail = Post.Empty,
  });

  final List<Post> posts;
  final Post postDetail;

  PostState copyWith({
    List<Post>? posts,
    Post? postDetail,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      postDetail: postDetail ?? this.postDetail,
    );
  }

  @override
  List<Object?> get props => [posts, postDetail];
}
