import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/domain/entities/user/user.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignInLoadingState extends SignInState {
  const SignInLoadingState();
}

final class SignInErrorState extends SignInState {
  final Failure failure;

  const SignInErrorState({required this.failure});
}

final class SignInSuccessState extends SignInState {
  final Map<String, dynamic> SignInModelResponse;

  const SignInSuccessState({required this.SignInModelResponse});
}
