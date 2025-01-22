part of 'post_cubit.dart';

@JsonSerializable()
class PostState extends Equatable {
  const PostState({
    this.posts = const [],
    this.postDetail = Post.Empty,
    this.comments = const [],
  });

  final List<Post> posts;
  final Post postDetail;
  final List<Comment> comments;

  PostState copyWith({
    List<Post>? posts,
    Post? postDetail,
    List<Comment>? comments,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      postDetail: postDetail ?? this.postDetail,
      comments: comments ?? this.comments,
    );
  }

  @override
  List<Object?> get props => [posts, postDetail, comments];
}
