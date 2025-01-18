// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => $checkedCreate(
      'User',
      json,
      ($checkedConvert) {
        final val = User(
          id: $checkedConvert('id', (v) => (v as num).toInt()),
          name: $checkedConvert('name', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          email: $checkedConvert('email', (v) => v as String),
          address: $checkedConvert(
              'address', (v) => Address.fromJson(v as Map<String, dynamic>)),
          phone: $checkedConvert('phone', (v) => v as String),
          website: $checkedConvert('website', (v) => v as String),
          company: $checkedConvert(
              'company', (v) => Company.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
