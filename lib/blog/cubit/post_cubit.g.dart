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
          postStatus: $checkedConvert('post_status',
              (v) => $enumDecodeNullable(_$StatusEnumMap, v) ?? Status.initial),
          postsStatus: $checkedConvert('posts_status',
              (v) => $enumDecodeNullable(_$StatusEnumMap, v) ?? Status.initial),
        );
        return val;
      },
      fieldKeyMap: const {
        'postDetail': 'post_detail',
        'postStatus': 'post_status',
        'postsStatus': 'posts_status'
      },
    );

Map<String, dynamic> _$PostStateToJson(PostState instance) => <String, dynamic>{
      'posts': instance.posts.map((e) => e.toJson()).toList(),
      'post_detail': instance.postDetail.toJson(),
      'comments': instance.comments.map((e) => e.toJson()).toList(),
      'post_status': _$StatusEnumMap[instance.postStatus]!,
      'posts_status': _$StatusEnumMap[instance.postsStatus]!,
    };

const _$StatusEnumMap = {
  Status.initial: 'initial',
  Status.loading: 'loading',
  Status.success: 'success',
  Status.failure: 'failure',
};
