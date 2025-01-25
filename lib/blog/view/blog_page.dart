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
    context.read<PostCubit>().getPostDetail(widget.postId);
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
                  PostDetail(postDetail: state.postDetail, comments: state.comments),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PostDetail extends StatelessWidget {
  const PostDetail({
    required this.postDetail,
    required this.comments,
    super.key,
  });

  final Post postDetail;
  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text(
          postDetail.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8),
        Text(
          postDetail.body,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text(
              'By: ${postDetail.username}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(width: 8),
            CircleAvatar(
                backgroundImage: AssetImage(postDetail.avatar))
          ],
        ),
        SizedBox(height: 16),
        Text(
          'Comments',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.name,
                    style:
                        Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    comment.body,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'By: ${comment.email}',
                    style:
                        Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(height: 8),
                ],
              );
            },
          ),
        )
      ],
    ));
  }
}
