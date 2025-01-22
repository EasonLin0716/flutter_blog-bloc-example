// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostState _$PostStateFromJson(Map<String, dynamic> json) => $checkedCreate(
      'PostState',
      json,
      ($checkedConvert) {
        final val = PostState(
          posts: $checkedConvert(
              'posts',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
          postDetail: $checkedConvert(
              'post_detail',
              (v) => v == null
                  ? Post.Empty
                  : Post.fromJson(v as Map<String, dynamic>)),
          comments: $checkedConvert(
              'comments',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
        );
        return val;
      },
      fieldKeyMap: const {'postDetail': 'post_detail'},
    );

Map<String, dynamic> _$PostStateToJson(PostState instance) => <String, dynamic>{
      'posts': instance.posts.map((e) => e.toJson()).toList(),
      'post_detail': instance.postDetail.toJson(),
      'comments': instance.comments.map((e) => e.toJson()).toList(),
    };
