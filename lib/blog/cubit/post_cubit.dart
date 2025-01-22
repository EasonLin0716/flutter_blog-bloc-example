import 'package:bloc/bloc.dart';
import 'package:flutter_blog/blog/models/comment.dart';
import 'package:flutter_blog/blog/post.dart';
import 'package:blog_repository/blog_repository.dart' show BlogRepository;
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_cubit.g.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this._blogRepository) : super(PostState());
  final BlogRepository _blogRepository;
  Future<void> getPosts(keyword) async {
    final posts = (await _blogRepository.getPosts(keyword)).map((post) => Post.fromRepository(post)).toList();
    emit(state.copyWith(posts: posts));
  }
  Future<void> getPost(int id) async {
    final postDetail = Post.fromRepository(await _blogRepository.getPost(id));
    emit(state.copyWith(postDetail: postDetail));
  }
  Future<void> getCommentsByPostId(int postId) async {
    final comments = (await _blogRepository.getCommentsByPostId(postId)).map((comment) => Comment.fromRepository(comment)).toList();
    emit(state.copyWith(comments: comments));
  }
}
