import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:temry_market/core/error/failures.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoadingState extends ForgetPasswordState {
  const ForgetPasswordLoadingState();
}

final class ForgetPasswordErrorState extends ForgetPasswordState {
  final Failure failure;

  const ForgetPasswordErrorState({required this.failure});
}

final class ForgetPasswordSuccessState extends ForgetPasswordState {
  final Unit ForgetPasswordModelResponse;

  const ForgetPasswordSuccessState({required this.ForgetPasswordModelResponse});
}
