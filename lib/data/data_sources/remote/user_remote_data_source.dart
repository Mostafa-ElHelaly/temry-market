import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:temry_market/core/constant/constant_api.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:http/http.dart' as http;
import 'package:temry_market/domain/usecases/user/forget_password_usecase.dart';

import 'package:temry_market/core/error/exceptions.dart';
import 'package:temry_market/domain/usecases/user/sign_in_usecase.dart';
import 'package:temry_market/domain/usecases/user/sign_up_usecase.dart';

abstract class UserRemoteDataSource {
  Future<Map<String, dynamic>> signIn(SignInParams params);
  Future<Unit> signUp(SignUpParams params);
  Future<Unit> forgetpassword(ForgetPasswordParams params);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> signIn(SignInParams params) async {
    final body = {
      'email': params.email,
      'password': params.password,
    };
    final response = await client.post(Uri.parse(ConstantApi.login),
        headers: {
          'Content-Type': "application/x-www-form-urlencoded",
        },
        body: body);
    print(body['email']);
    print(body['password']);

    print('--------------------------------');
    print(response.statusCode);
    print('--------------------------------');
    print(response.body);
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return responseBody;
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> signUp(SignUpParams params) async {
    final body = {
      'first_name': params.firstName,
      'last_name': params.lastName,
      'email': params.email,
      'mobile': params.mobile,
      'password': params.password,
    };
    final response = await client.post(Uri.parse(ConstantApi.register),
        headers: {
          'Content-Type': "application/x-www-form-urlencoded",
        },
        body: body);
    print(body['email']);
    print(body['password']);
    print(body['first_name']);
    print(body['mobile']);
    print(body['last_name']);
    print('--------------------------------');
    print(response.statusCode);
    print('--------------------------------');
    print(response.body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> forgetpassword(ForgetPasswordParams params) async {
    final body = {
      "email": params.email,
    };

    print("---------------");
    final response = await client.post(Uri.parse(ConstantApi.forgetpassword),
        headers: {
          'Content-Type': "application/x-www-form-urlencoded",
        },
        body: body);
    print(body['email']);
    print(response.body);

    print(response.statusCode);

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure();
    } else {
      throw ServerException();
    }
  }
}
