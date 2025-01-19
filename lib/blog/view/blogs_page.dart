import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/blog/post.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key, required this.title});

  final String title;

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
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
                        child: _SearchFIeld(context)),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                  child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return _BlogsList(post);
                },
              ))
            ],
          );
        },
      )),
    );
  }

  TextField _SearchFIeld(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration:
          const InputDecoration(labelText: 'Post', hintText: 'Search any post'),
      onSubmitted: (_) {
        print('_text: $_text');
        context.read<PostCubit>().getPosts(_text);
      },
    );
  }

  ListTile _BlogsList(Post post) {
    return ListTile(
      title: Text(post.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.body),
          Text('By ${post.username}',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      isThreeLine: true,
    );
  }
}
