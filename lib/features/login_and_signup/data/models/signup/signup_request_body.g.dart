// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'userName': instance.userName,
      'email': instance.email,
      'password': instance.password,
    };
