import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  static Route<void> route(int postId) {
    return MaterialPageRoute<void>(builder: (_) => BlogPage(postId: postId));
  }
  final int postId;
  const BlogPage({super.key, required this.postId});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Blog'),
      ),
      body: Text('Blog Page postId: $postId'),
    );
  }
}