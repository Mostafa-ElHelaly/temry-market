import 'dart:convert';

import '../../../domain/entities/user/user.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

// ignore: must_be_immutable
class UserModel extends User {
  UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.gender,
    required super.birthdate,
    required super.email,
    required super.mobile,
    required super.password,
    super.passwordToken,
    super.googleId,
    super.googleAccount,
    super.facebookId,
    super.facebookAccount,
    super.appleId,
    super.appleAccount,
    required super.banned,
    required super.deleted,
    super.delstamp,
    required super.addstamp,
    required super.updatestamp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        birthdate: json["birthdate"],
        email: json["email"],
        mobile: json["mobile"],
        password: json["password"],
        passwordToken: json["password_token"],
        googleId: json["google_id"],
        googleAccount: json["google_account"],
        facebookId: json["facebook_id"],
        facebookAccount: json["facebook_account"],
        appleId: json["apple_id"],
        appleAccount: json["apple_account"],
        banned: json["banned"],
        deleted: json["deleted"],
        delstamp: json["delstamp"],
        addstamp: json["addstamp"],
        updatestamp: json["updatestamp"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "birthdate": birthdate,
        "email": email,
        "mobile": mobile,
        "password": password,
        "password_token": passwordToken,
        "google_id": googleId,
        "google_account": googleAccount,
        "facebook_id": facebookId,
        "facebook_account": facebookAccount,
        "apple_id": appleId,
        "apple_account": appleAccount,
        "banned": banned,
        "deleted": deleted,
        "delstamp": delstamp,
        "addstamp": addstamp,
        "updatestamp": updatestamp,
      };
}
