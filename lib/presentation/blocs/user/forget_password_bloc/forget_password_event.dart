abstract class BaseState {}

class ForgetPasswordEvent extends BaseState {
  String email;

  ForgetPasswordEvent({required this.email});
}
