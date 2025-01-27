import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blog/blog/post.dart';
import 'package:flutter_blog/blog/view/blog_page.dart';

class BlogsPage extends StatefulWidget {
  const BlogsPage({super.key, required this.title});

  final String title;

  @override
  State<BlogsPage> createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {
  final TextEditingController _textController = TextEditingController();

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
                        child: _SearchField(context)),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: state.postsStatus == Status.loading
                    ? const Center(child: CircularProgressIndicator())
                    : _PostsList(state.posts),
              )
            ],
          );
        },
      )),
    );
  }

  TextField _SearchField(BuildContext context) {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        labelText: 'Post',
        hintText: 'Search any post',
        suffixIcon: _textController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _textController.clear();
                  context.read<PostCubit>().getPosts('');
                },
              )
            : null,
      ),
      onSubmitted: (_) {
        context.read<PostCubit>().getPosts(_textController.text);
      },
    );
  }

  Widget _PostsList(List<Post> posts) {
    if (posts.isEmpty) {
      return Center(child: Text('No post found'));
    }
    return ListView.builder(itemBuilder: (context, index) {
      final post = posts[index];
      return ListTile(
        title: Text(
          post.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.body),
            Text('By ${post.username}',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: CachedNetworkImage(
          imageUrl: post.cover,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Icon(Icons.error),
          fadeOutDuration: Duration(seconds: 0),
          fadeInDuration: Duration(seconds: 0),
        ),
        isThreeLine: true,
        onTap: () {
          // print(post.id);
          final postId = post.id;
          Navigator.of(context).push<void>(BlogPage.route(postId));
        },
      );
    });
  }
}
