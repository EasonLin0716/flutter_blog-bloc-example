import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_blog/blog/post.dart';
import 'package:flutter_blog/blog/view/blogs_page.dart';

void main() {
  runApp(BlogApp(
    blogRepository: BlogRepository(),
  ));
}

class BlogApp extends StatelessWidget {
  const BlogApp({required BlogRepository blogRepository, super.key})
      : _blogRepository = blogRepository;

  final BlogRepository _blogRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostCubit(_blogRepository),
      child: MaterialApp(
        title: 'Flutter Blog',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const BlogsPage(title: 'Blog'),
      ),
    );
  }
}
