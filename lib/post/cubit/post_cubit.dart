import 'package:bloc/bloc.dart';
import 'package:blog_repository/blog_repository.dart' show Post, BlogRepository;
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_cubit.g.dart';
part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this._blogRepository) : super(PostState());
  final BlogRepository _blogRepository;
  Future<void> getPosts(keyword) async {
    final posts = await _blogRepository.getPosts(keyword);
    emit(state.copyWith(posts: posts));
  }
}
