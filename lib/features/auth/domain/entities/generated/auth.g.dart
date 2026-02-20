// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthData _$AuthDataFromJson(Map<String, dynamic> json) => _AuthData(
  token: json['token'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$AuthDataToJson(_AuthData instance) => <String, dynamic>{
  'token': instance.token,
  'refreshToken': instance.refreshToken,
};
