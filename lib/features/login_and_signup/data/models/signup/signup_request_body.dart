import 'package:json_annotation/json_annotation.dart';

part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String userName;
  final String email;
  final String password;

  SignupRequestBody({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userName,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
