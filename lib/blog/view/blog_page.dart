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
            if (state.postStatus == PostStatus.loading) {
              return CircularProgressIndicator();
            }
            return Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _PostDetail(
                          postDetail: state.postDetail,
                          comments: state.comments),
                    ],
                  ),
                ));
          },
        ),
      ),
    );
  }
}

class _PostDetail extends StatelessWidget {
  const _PostDetail({
    required this.postDetail,
    required this.comments,
    super.key,
  });

  final Post postDetail;
  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          postDetail.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Text(
          postDetail.body,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              'By: ${postDetail.username}',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(width: 8),
            CircleAvatar(backgroundImage: AssetImage(postDetail.avatar))
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Comments',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true, // 讓 ListView 只佔用必要的空間
          physics:
              const NeverScrollableScrollPhysics(), // 停用 ListView 自己的滾動，交給外層的 `SingleChildScrollView`
          itemCount: comments.length,
          itemBuilder: (context, index) {
            final comment = comments[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.name,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(
                  comment.body,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'By: ${comment.email}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 8),
              ],
            );
          },
        ),
      ],
    );
  }
}
