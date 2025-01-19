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
        );
        return val;
      },
    );

Map<String, dynamic> _$PostStateToJson(PostState instance) => <String, dynamic>{
      'posts': instance.posts.map((e) => e.toJson()).toList(),
    };
