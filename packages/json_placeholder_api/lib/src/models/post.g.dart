// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Post',
      json,
      ($checkedConvert) {
        final val = Post(
          userId: $checkedConvert('user_id', (v) => (v as num).toInt()),
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          title: $checkedConvert('title', (v) => v as String),
          body: $checkedConvert('body', (v) => v as String),
          cover: $checkedConvert('cover', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'userId': 'user_id'},
    );
