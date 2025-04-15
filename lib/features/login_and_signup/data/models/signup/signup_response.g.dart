// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse(
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'token': instance.token,
    };
