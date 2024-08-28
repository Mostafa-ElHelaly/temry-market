import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class User extends Equatable {
  late int id;
  late String firstName;
  late String lastName;
  late String gender;
  late String birthdate;
  late String email;
  late String mobile;
  late String password;
  late dynamic passwordToken;
  late dynamic googleId;
  late dynamic googleAccount;
  late dynamic facebookId;
  late dynamic facebookAccount;
  late dynamic appleId;
  late dynamic appleAccount;
  late String banned;
  late String deleted;
  late dynamic delstamp;
  late String addstamp;
  late String updatestamp;

  String? image;

  User({
    required int id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthdate,
    required this.email,
    required this.mobile,
    required this.password,
    this.passwordToken,
    this.googleId,
    this.googleAccount,
    this.facebookId,
    this.facebookAccount,
    this.appleId,
    this.appleAccount,
    required this.banned,
    required this.deleted,
    this.delstamp,
    required this.addstamp,
    required this.updatestamp,
    this.image,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    passwordToken = json['password_token'];
    googleId = json['google_id'];
    googleAccount = json['google_account'];
    facebookId = json['facebook_id'];
    facebookAccount = json['facebook_account'];
    appleId = json['apple_id'];
    appleAccount = json['apple_account'];
    banned = json['banned'];
    deleted = json['deleted'];
    delstamp = json['delstamp'];
    addstamp = json['addstamp'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['birthdate'] = this.birthdate;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['password_token'] = this.passwordToken;
    data['google_id'] = this.googleId;
    data['google_account'] = this.googleAccount;
    data['facebook_id'] = this.facebookId;
    data['facebook_account'] = this.facebookAccount;
    data['apple_id'] = this.appleId;
    data['apple_account'] = this.appleAccount;
    data['banned'] = this.banned;
    data['deleted'] = this.deleted;
    data['delstamp'] = this.delstamp;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    data['image'] = this.image;

    return data;
  }

  @override
  List<Object> get props => [
        id,
        firstName,
        lastName,
        email,
        gender,
        birthdate,
        mobile,
        password,
        passwordToken,
        googleId,
        googleAccount,
        facebookId,
        facebookAccount,
        appleId,
        appleAccount,
        banned,
        deleted,
        delstamp,
        addstamp,
        updatestamp,
      ];
}




// class User extends Equatable {
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String? image;
//   final String email;

//   const User({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     this.image,
//     required this.email,
//   });

//   @override
//   List<Object> get props => [
//     id,
//     firstName,
//     lastName,
//     email,
//   ];
// }