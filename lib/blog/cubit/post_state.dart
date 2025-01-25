part of 'post_cubit.dart';

enum Status { initial, loading, success, failure }

extension StatusX on Status {
  bool get isInitial => this == Status.initial;
  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isFailure => this == Status.failure;
}

@JsonSerializable()
class PostState extends Equatable {
  const PostState({
    this.posts = const [],
    this.postDetail = Post.Empty,
    this.comments = const [],
    this.postStatus = Status.initial,
    this.postsStatus = Status.initial,
  });

  final List<Post> posts;
  final Post postDetail;
  final List<Comment> comments;
  final Status postStatus;
  final Status postsStatus;

  PostState copyWith({
    List<Post>? posts,
    Post? postDetail,
    List<Comment>? comments,
    Status? postStatus,
    Status? postsStatus,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      postDetail: postDetail ?? this.postDetail,
      comments: comments ?? this.comments,
      postStatus: postStatus ?? this.postStatus,
      postsStatus: postsStatus ?? this.postsStatus,
    );
  }

  @override
  List<Object?> get props => [posts, postDetail, comments, postStatus, postsStatus];
}
