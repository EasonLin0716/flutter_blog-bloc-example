import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/blog/post.dart';

class BlogPage extends StatefulWidget {
  static Route<void> route(int postId) {
    return MaterialPageRoute<void>(builder: (_) => BlogPage(postId: postId));
  }
  final int postId;
  const BlogPage({super.key, required this.postId});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostCubit>().getPost(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Blog'),
      ),
      body: Center(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state.postDetail.title == '') {
              return CircularProgressIndicator();
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    state.postDetail.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 8),
                  Text(
                    state.postDetail.body,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'By: ${state.postDetail.username}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}