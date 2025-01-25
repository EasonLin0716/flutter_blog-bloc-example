import 'package:cached_network_image/cached_network_image.dart';
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
            if (state.postStatus == Status.loading) {
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
      spacing: 8,
      children: [
        Text(
          postDetail.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          spacing: 8,
          children: [
            CircleAvatar(backgroundImage: AssetImage(postDetail.avatar)),
            Text(
              postDetail.username,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        Center(
          child: CachedNetworkImage(
            imageUrl: postDetail.cover,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Text(
          postDetail.body,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Divider(),
        Text(
          'Comments',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ListView.builder(
          shrinkWrap: true, // 讓 ListView 只佔用必要的空間
          physics:
              const NeverScrollableScrollPhysics(), // 停用 ListView 自己的滾動，交給外層的 `SingleChildScrollView`
          itemCount: comments.length,
          itemBuilder: (context, index) {
            final comment = comments[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(
                  comment.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  comment.body,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'By: ${comment.email}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Divider(),
              ],
            );
          },
        ),
      ],
    );
  }
}
