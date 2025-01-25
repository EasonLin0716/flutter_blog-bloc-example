part of 'post_cubit.dart';

enum PostStatus { initial, loading, success, failure }

extension PostStatusX on PostStatus {
  bool get isInitial => this == PostStatus.initial;
  bool get isLoading => this == PostStatus.loading;
  bool get isSuccess => this == PostStatus.success;
  bool get isFailure => this == PostStatus.failure;
}

@JsonSerializable()
class PostState extends Equatable {
  const PostState({
    this.posts = const [],
    this.postDetail = Post.Empty,
    this.comments = const [],
    this.postStatus = PostStatus.initial,
  });

  final List<Post> posts;
  final Post postDetail;
  final List<Comment> comments;
  final PostStatus postStatus;

  PostState copyWith({
    List<Post>? posts,
    Post? postDetail,
    List<Comment>? comments,
    PostStatus? postStatus,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      postDetail: postDetail ?? this.postDetail,
      comments: comments ?? this.comments,
      postStatus: postStatus ?? this.postStatus,
    );
  }

  @override
  List<Object?> get props => [posts, postDetail, comments, postStatus];
}
