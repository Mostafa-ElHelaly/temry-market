import 'package:temry_market/core/constant/constant_api.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';
import '../../../domain/usecases/user/sign_in_usecase.dart';
import '../../../domain/usecases/user/sign_up_usecase.dart';
import '../../models/user/authentication_response_model.dart';

abstract class UserRemoteDataSource {
  Future<AuthenticationResponseModel> signIn(SignInParams params);
  Future<AuthenticationResponseModel> signUp(SignUpParams params);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<AuthenticationResponseModel> signIn(SignInParams params) async {
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
    if (response.statusCode == 200) {
      return authenticationResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthenticationResponseModel> signUp(SignUpParams params) async {
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
    if (response.statusCode == 201) {
      return authenticationResponseModelFromJson(response.body);
    } else if (response.statusCode == 400 || response.statusCode == 401) {
      throw CredentialFailure();
    } else {
      throw ServerException();
    }
  }
}
