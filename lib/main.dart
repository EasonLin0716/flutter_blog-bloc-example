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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
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
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void initState() {
    super.initState();
    context.read<PostCubit>().getPosts(''); // 預設載入全部貼文
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          controller: _textController,
                          decoration: const InputDecoration(
                              labelText: 'Post', hintText: 'Search any post'),
                          onSubmitted: (_) {
                            print('_text: $_text');
                            context.read<PostCubit>().getPosts(_text);
                          },
                        )),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                  child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return ListTile(
                    title: Text(post.formattedTitle),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.formattedBody),
                        Text('By ${post.username}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    isThreeLine: true,
                  );
                },
              ))
            ],
          );
        },
      )),
    );
  }
}
