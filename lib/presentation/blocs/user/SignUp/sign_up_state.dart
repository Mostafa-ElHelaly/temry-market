import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:temry_market/core/error/failures.dart';
import 'package:temry_market/domain/entities/user/user.dart';

abstract class SignUPState extends Equatable {
  const SignUPState();

  @override
  List<Object> get props => [];
}

final class SignUPInitial extends SignUPState {}

final class SignUPLoadingState extends SignUPState {
  const SignUPLoadingState();
}

final class SignUPErrorState extends SignUPState {
  final Failure failure;

  const SignUPErrorState({required this.failure});
}

final class SignUPSuccessState extends SignUPState {
  final Unit SignUPModelResponse;

  const SignUPSuccessState({required this.SignUPModelResponse});
}
