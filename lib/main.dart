import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_repository/blog_repository.dart';
import 'package:flutter_blog/post/post.dart';

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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Blog'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          context.read<PostCubit>().getPosts();
          // render posts
          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final post = state.posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
                trailing: Text('User ${post.userId}'),
              );
            },
          );
        },
      )),
    );
  }
}
