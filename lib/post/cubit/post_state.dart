part of 'post_cubit.dart';

@JsonSerializable()
class PostState extends Equatable {
  const PostState({
    this.posts = const [],
  });

  final List<Post> posts;

  @override
  List<Object?> get props => [];
}

final class PostInitial extends PostState {}
